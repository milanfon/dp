const {updateObject, URLBuilder, checkNumericArray, objectsEqual} = require('../inputs/js');

describe('updateObject function', () => {
    test('should merge two objects', () => {
        const a = { x: 1, y: 2 };
        const b = { y: 3, z: 4 };
        updateObject(a, b);
        expect(a).toEqual({ x: 1, y: 3, z: 4 });
    });
});

describe('URLBuilder function', () => {
    test('should build URL with parameters', () => {
        const url = 'https://example.com';
        const params = { p1: 'value1', p2: 'value2' };
        expect(URLBuilder(url, params)).toBe('https://example.com?p1=value1&p2=value2');
    });
});

describe('checkNumericArray function', () => {
    test('should throw error if array is not numeric', () => {
        const array = ['a', 'b'];
        expect(() => checkNumericArray(array)).toThrow();
    });
    
    // Add more tests as needed
});

describe('objectsEqual function', () => {
    test('should return true if objects are equal', () => {
        const obj1 = { a: 1, b: 2 };
        const obj2 = { a: 1, b: 2 };
        expect(objectsEqual(obj1, obj2)).toBeTruthy();
    });
    
    test('should return false if objects are not equal', () => {
        const obj1 = { a: 1, b: 2 };
        const obj2 = { a: 1, b: 3 };
        expect(objectsEqual(obj1, obj2)).toBeFalsy();
    });
    
    // Add more tests as needed
});
