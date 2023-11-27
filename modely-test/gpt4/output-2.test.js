const {updateObject, URLBuilder, checkNumericArray, objectsEqual} = require('../inputs/js');

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

  test('should not overwrite non-object properties with undefined', () => {
    const a = { x: 1 };
    const b = { x: undefined };
    updateObject(a, b);
    expect(a).toEqual({ x: 1 });
  });

  test('should handle nested objects correctly', () => {
    const a = { x: { y: 1 } };
    const b = { x: { z: 2 } };
    updateObject(a, b);
    expect(a).toEqual({ x: { y: 1, z: 2 } });
  });

  test('should handle array properties', () => {
    const a = { x: [1, 2] };
    const b = { x: [3, 4] };
    updateObject(a, b);
    expect(a).toEqual({ x: [3, 4] });
  });

  test('should not overwrite properties with undefined', () => {
    const a = { x: 1 };
    const b = { x: undefined };
    updateObject(a, b);
    expect(a).toEqual({ x: 1 });
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

  test('should correctly handle multiple query parameters', () => {
    const url = 'http://example.com';
    const params = { a: 1, b: 'test', c: true };
    expect(URLBuilder(url, params)).toBe('http://example.com?a=1&b=test&c=true');
  });

  test('should handle empty values in query parameters', () => {
    const url = 'http://example.com';
    const params = { a: 1, b: '' };
    expect(URLBuilder(url, params)).toBe('http://example.com?a=1&b=');
  });

  test('should correctly append multiple query parameters', () => {
    const url = 'http://example.com';
    const params = { a: 1, b: 'test' };
    expect(URLBuilder(url, params)).toBe('http://example.com?a=1&b=test');
  });

  test('should handle empty parameters object', () => {
    const url = 'http://example.com';
    const params = {};
    expect(URLBuilder(url, params)).toBe(url);
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

  test('should handle empty arrays', () => {
    expect(checkNumericArray([])).toEqual([]);
  });

  test('should validate arrays with specified length', () => {
    const array = [1, 2, 3];
    expect(checkNumericArray(array, 3)).toEqual(array);
  });

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

  test('should return false if properties exist in one object but not the other', () => {
    const obj1 = { a: 1, b: 2 };
    const obj2 = { a: 1 };
    expect(objectsEqual(obj1, obj2)).toBe(false);
  });

  test('should handle null and undefined values correctly', () => {
    const obj1 = { a: null };
    const obj2 = { a: undefined };
    expect(objectsEqual(obj1, obj2)).toBe(false);
  });

  test('should handle nested objects with different structures', () => {
    const obj1 = { a: { b: 1 } };
    const obj2 = { a: { c: 1 } };
    expect(objectsEqual(obj1, obj2)).toBe(false);
  });

  test('should handle arrays correctly', () => {
    const obj1 = { a: [1, 2, 3] };
    const obj2 = { a: [1, 2, 3] };
    expect(objectsEqual(obj1, obj2)).toBe(true);
  });

  test('should return false for arrays of different lengths', () => {
    const obj1 = { a: [1, 2, 3] };
    const obj2 = { a: [1, 2] };
    expect(objectsEqual(obj1, obj2)).toBe(false);
  });

});
