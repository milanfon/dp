const {updateObject, URLBuilder, checkNumericArray, objectsEqual} = require('../inputs/js-e');

describe('updateObject()', () => {
    it('updates a property', () => {
        const o = { a: { b: 1 } };
        updateObject(o, { a: { b: 2 } });
        expect(o.a.b).toBe(2);
    });

    it('updates a nested property', () => {
        const o = { a: { b: 1 } };
        updateObject(o, { a: { b: { c: 2 } } });
        expect(o.a.b.c).toBe(2);
    });

    it('overrides the original object', () => {
        const o = { a: { b: 1 } };
        updateObject(o, { a: { b: 2 } });
        expect(o).toEqual({ a: { b: 2 } });
    });
});

describe('URLBuilder()', () => {
    it('appends query parameters', () => {
        expect(URLBuilder('/foo', { a: 1 })).toBe('/foo?a=1');
        expect(URLBuilder('/foo', { a: 1, b: 2 })).toBe('/foo?a=1&b=2');
    });

    it('ignores empty parameters', () => {
        expect(URLBuilder('/foo', {})).toBe('/foo');
    });
});

describe('checkNumericArray()', () => {
    it('checks if the array is empty', () => {
        expect(checkNumericArray([])).toEqual([]);
    });

    it('checks if the array contains only numeric values', () => {
        expect(checkNumericArray([1, 2, 3])).toEqual([1, 2, 3]);
    });

    it('checks if the array contains only numeric values of the expected length', () => {
        expect(checkNumericArray([1, 2, 3], 3)).toEqual([1, 2, 3]);
    });

    it('throws an error if the array is not empty and does not contain only numeric values', () => {
        expect(() => checkNumericArray(['foo'])).toThrow(Error);
    });

    it('throws an error if the array contains non-numeric values', () => {
        expect(() => checkNumericArray([1, 2, 'foo'])).toThrow(Error);
    });

    it('throws an error if the array does not match the expected length', () => {
        expect(() => checkNumericArray([1, 2, 3], 4)).toThrow(Error);
    });
});

describe('objectsEqual()', () => {
    it('checks if the objects are equal', () => {
        expect(objectsEqual({ foo: 1 }, { foo: 1 })).toBe(true);
        expect(objectsEqual({ foo: 1, bar: 2 }, { foo: 1, bar: 2 })).toBe(true);
    });

    it('checks if the objects are not equal', () => {
        expect(objectsEqual({ foo: 1 }, { foo: 2 })).toBe(false);
        expect(objectsEqual({ foo: 1, bar: 2 }, { foo: 1 })).toBe(false);
    });

    it('compares nested objects', () => {
        expect(objectsEqual({ foo: { bar: 1 } }, { foo: { bar: 1 } })).toBe(true);
        expect(objectsEqual({ foo: { bar: 1 } }, { foo: { bar: 2 } })).toBe(false);
    });
});
