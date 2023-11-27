const {updateObject, URLBuilder, checkNumericArray, objectsEqual} = require('../inputs/js');

test('updateObject should merge two objects', () => {
    const a = { x: 1, y: 2 };
    const b = { y: 3, z: 4 };
    updateObject(a, b);
    expect(a).toEqual({ x: 1, y: 3, z: 4 });
});

test('URLBuilder should build URL with parameters', () => {
    const url = 'https://example.com';
    const params = { p1: 'value1', p2: 'value2' };
    expect(URLBuilder(url, params)).toBe('https://example.com?p1=value1&p2=value2');
});

test('checkNumericArray should throw error if array is not numeric', () => {
    const array = ['a', 'b'];
    expect(() => checkNumericArray(array)).toThrow();
});

test('objectsEqual should return true if objects are equal', () => {
    const obj1 = { a: 1, b: 2 };
    const obj2 = { a: 1, b: 2 };
    expect(objectsEqual(obj1, obj2)).toBeTruthy();
});

test('objectsEqual should return false if objects are not equal', () => {
    const obj1 = { a: 1, b: 2 };
    const obj2 = { a: 1, b: 3 };
    expect(objectsEqual(obj1, obj2)).toBeFalsy();
});
