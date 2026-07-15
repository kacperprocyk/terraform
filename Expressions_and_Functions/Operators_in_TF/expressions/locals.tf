locals {
  math       = 2 * 2 # math operators: *, /, +, -, -<number>
  equality   = 2 == 2 / 2 != 1
  comparison = 2 > 1 # comparison operators: <, <=, >=, >
  logical    = true && false # logical operators: && / ||
}

output "operators" {
  value = {
    math       = local.math
    equality   = local.equality
    comparison = local.comparison
    logical    = local.logical
  }
}