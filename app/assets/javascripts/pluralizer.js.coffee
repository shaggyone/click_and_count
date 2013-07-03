window.pluralize = (number, one, some, many)->
  number = (number - 0) + ""
  if /1$/.test(number) && !/1.$/.test(number)
    one
  else if /[234]$/.test(number) && !/1.$/.test(number)
    some
  else
    many


