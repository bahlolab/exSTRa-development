#' Return a data.table with p-values of a tsum_exstra object.
#'
#'
#'
#' @param tsum An exstra_tsum object.
#' @param correction Correction method to use. Use "bf" or "bonferroni" for Bonferroni correction, and
#'                   "uncorrected" or FALSE for no correction. ("bonferroni" is also acceptable).
#'                   "samples" is Bonferroni correction by the number of tests (samples) at each locus.
#'                   "loci" is Bonferroni correction by the number of loci.
#'
#' @param alpha Significance level alpha.
#' @param only.signif If TRUE, only return significant results.
#' @param modify If TRUE, will modify the tsum$stats table. Effectively ignored if only.sig == TRUE.
#' @return A \code{data.table} keyed by "locus" then "sample".
#'         Other columns are \code{tsum} as calculated by \code{\link{tsum_test}}, \code{p.value} (uncorrected),
#'         \code{signif} (TRUE if significant after given correction), and
#'         \code{p.value.sd}, giving the standard deviation of the p-value estimate from the
#'         simulation.
#'
#' @import magrittr
#' @importFrom testit assert
#' @export
p_values <- function(tsum,
                     correction = c("bf", "bonferroni", "loci", "samples", "uncorrected"),
                     alpha = 0.05,
                     only.signif = FALSE,
                     modify = FALSE) {
  # verify input
  if (!missing(tsum)) {
    assert("tsum should be an exstra_tsum object.", is.exstra_tsum(tsum))
  }
  assert("alpha should be a probability value.", alpha >= 0, alpha <= 1)
  assert("only.signif should be a logical.", is.logical(only.signif))
  correction <- match.arg(correction)

  n_tests <- tsum$n_tests
  out.table <- tsum$stats
  if (!modify) { # make a copy so we do not modify it
    out.table %<>% copy()
  }

  # output
  if ((is.logical(correction[1]) && correction[1]) || correction[1] == "bf" || correction[1] == "bonferroni") {
    # Bonferroni correction.
    # only correct for tests we have performed:
    out.table[, signif := p.value <= alpha / n_tests]
  } else if ((is.logical(correction[1]) && !correction[1]) || correction[1] == "uncorrected") {
    out.table[, signif := p.value <= alpha]
  } else if (correction[1] == "samples") {
    out.table[!is.na(p.value), N := .N, by = locus]
    out.table[, signif := p.value <= alpha / N]
    out.table[, N := NULL]
  } else if (correction[1] == "loci") {
    out.table[!is.na(p.value), N := .N, by = sample]
    out.table[, signif := p.value <= alpha / N]
    out.table[, N := NULL]
  }
  if (only.signif) {
    # Only keep significant results
    out.table <- out.table[identity(signif)]
  }
  setkey(out.table, locus, sample)
  return(out.table[])
}
