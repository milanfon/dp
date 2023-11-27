const {updateObject, URLBuilder, checkNumericArray, objectsEqual} = require('../inputs/js-e');

describe('updateObject', () => {
  test('should deeply merge properties from object b into a', () => {
    const a = { x: 1, y: { z: 3 } };
    const b = { x: 2, y: { z: 4, w: 5 } };
    updateObject(a, b);
    expect(a).toEqual({ x: 2, y: { z: 4, w: 5 } });
  });

  test('should handle non-object properties', () => {
    const a = { x: 1 };
    const b = { y: 2 };
    updateObject(a, b);
    expect(a).toEqual({ x: 1, y: 2 });
  });
});

describe('URLBuilder', () => {
  test('should construct URL with query parameters', () => {
    const url = 'http://example.com';
    const params = { a: 1, b: 'test' };
    expect(URLBuilder(url, params)).toBe('http://example.com?a=1&b=test');
  });

  test('should return base URL if parameters object is empty', () => {
    const url = 'http://example.com';
    const params = {};
    expect(URLBuilder(url, params)).toBe('http://example.com');
  });
});

describe('checkNumericArray', () => {
  test('should validate numeric array', () => {
    const array = [1, 2, 3];
    expect(checkNumericArray(array)).toEqual(array);
  });

  test('throws NotAnArrayError if input is not an array', () => {
    expect(() => checkNumericArray(123)).toThrow('NotAnArrayError');
  });

  test('throws ArrayNotNumericError if array contains non-numeric values', () => {
    expect(() => checkNumericArray([1, 'a', 3])).toThrow('ArrayNotNumericError');
  });

  test('throws ArrayUnexpectedLenError if array length does not match specified length', () => {
    const array = [1, 2, 3];
    expect(() => checkNumericArray(array, 2)).toThrow('ArrayUnexpectedLenError');
  });
});

describe('objectsEqual', () => {
  test('should return true if objects are equal', () => {
    const obj1 = { a: 1, b: { c: 2 } };
    const obj2 = { a: 1, b: { c: 2 } };
    expect(objectsEqual(obj1, obj2)).toBe(true);
  });

  test('should return false if objects are not equal', () => {
    const obj1 = { a: 1, b: { c: 2 } };
    const obj2 = { a: 1, b: { c: 3 } };
    expect(objectsEqual(obj1, obj2)).toBe(false);
  });
});
