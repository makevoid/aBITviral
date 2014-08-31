abv = {} unless abv
abv.crypto = {}

# generate random_password
abv.crypto.random_password = (length) ->
  @regenerate_until_nonmatches length

# private

abv.crypto.escluded_chars = /l0OI/
abv.crypto.max_length = 10

abv.crypto.random_password_generate = (length) ->
  return "can't generate a short password" if length < 3
  length = 10 if length > @max_length
  if false
    @random_password_crypto length
  else
    @random_password_legacy length

abv.crypto.random_password_crypto = (length) ->
  array = new Uint32Array length/3
  values = window.crypto.getRandomValues array
  rnd = _(values).map (elem) ->
    elem.toString(36)
  rnd.join("")[0..length-1]

abv.crypto.random_password_legacy = (length) ->
  Math.random().toString(36).slice -length

abv.crypto.regenerate_until_nonmatches = (length) ->
  password = @random_password_generate length
  unless password.match @escluded_chars
    password
  else
    @regenerate_until_nonmatches()

# String.fromCharCode(
