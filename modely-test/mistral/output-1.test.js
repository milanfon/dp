const {updateObject, URLBuilder, checkNumericArray, objectsEqual, ArrayNotNumericError, ArrayUnexpectedLenError} = require('../inputs/js');

describe('updateObject', () => {
  test('updates object with properties from b', () => {
    const a = { foo: 'bar' };
    const b = { foo: { bar: 'baz' }}, c = { baz: 'qux' };
    expect(updateObject(a, b)).toEqual(c);
  });
});

describe('URLBuilder', () => {
  test('appends query parameters to URL', () => {
    const url = 'https://example.com';
    const params = { foo: 'bar' };
    expect(URLBuilder(url, params)).toEqual('https://example.com?foo=bar');
  });
});

describe('checkNumericArray', () => {
  test('validates an array of numeric values', () => {
    const array = [1, 2, 3];
    expect(checkNumericArray(array)).toEqual([1, 2, 3]);
  });

  test('throws NotAnArrayError if input is not an array', () => {
    const array = 'abc';
    expect(() => checkNumericArray(array)).toThrow(NotAnArrayError);
  });

  test('throws ArrayNotNumericError if any value in the array is not numeric', () => {
    const array = [1, '2'];
    expect(() => checkNumericArray(array)).toThrow(ArrayNotNumericError);
  });
});

describe('objectsEqual', () => {
  test('returns true if objects are equal', () => {
    const reference = { foo: 'bar' };
    const comparison = { foo: 'baz' };
    expect(objectsEqual(reference, comparison)).toBe(true);
  });

  test('returns false if objects are not equal', () => {
    const reference = { foo: 'bar' };
    const comparison = { baz: 'qux' };
    expect(objectsEqual(reference, comparison)).toBe(false);
  });
});

