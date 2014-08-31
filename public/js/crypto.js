var abv;

if (!abv) {
  abv = {};
}

abv.crypto = {};

abv.crypto.random_password = function(length) {
  return this.regenerate_until_nonmatches(length);
};

abv.crypto.escluded_chars = /l0OI/;

abv.crypto.max_length = 10;

abv.crypto.random_password_generate = function(length) {
  if (length < 3) {
    return "can't generate a short password";
  }
  if (length > this.max_length) {
    length = 10;
  }
  if (false) {
    return this.random_password_crypto(length);
  } else {
    return this.random_password_legacy(length);
  }
};

abv.crypto.random_password_crypto = function(length) {
  var array, rnd, values;
  array = new Uint32Array(length / 3);
  values = window.crypto.getRandomValues(array);
  rnd = _(values).map(function(elem) {
    return elem.toString(36);
  });
  return rnd.join("").slice(0, +(length - 1) + 1 || 9e9);
};

abv.crypto.random_password_legacy = function(length) {
  return Math.random().toString(36).slice(-length);
};

abv.crypto.regenerate_until_nonmatches = function(length) {
  var password;
  password = this.random_password_generate(length);
  if (!password.match(this.escluded_chars)) {
    return password;
  } else {
    return this.regenerate_until_nonmatches();
  }
};
