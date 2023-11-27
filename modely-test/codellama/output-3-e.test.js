const { updateObject, URLBuilder, checkNumericArray, objectsEqual } = require('../inputs/js-e');

test('updateObject should merge properties from object b into object a recursively', () => {
    const a = { x: 1, y: { z: 2 }};
    const b = { y: { z: 3 }, w: 4 };
    updateObject(a, b);
    expect(a).toEqual({ x: 1, y: { z: 3 }, w: 4 });
});

test('URLBuilder should construct a URL with query parameters appended', () => {
    const url = 'https://example.com';
    const params = { p1: 'value1', p2: 'value2' };
    expect(URLBuilder(url, params)).toBe('https://example.com?p1=value1&p2=value2');
});

test('checkNumericArray should throw error if array is not numeric', () => {
    const array = ['a', 'b'];
    expect(() => checkNumericArray(array)).toThrow();
});

test('objectsEqual should return true if objects are equal', () => {
    const obj1 = { a: 1, b: { c: 2 }};
    const obj2 = { a: 1, b: { c: 2 }};
    expect(objectsEqual(obj1, obj2)).toBeTruthy();
});
