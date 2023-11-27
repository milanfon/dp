const {updateObject, URLBuilder, checkNumericArray, objectsEqual, ArrayNotNumericError, ArrayUnexpectedLenError} = require('../inputs/js-e');

describe('test', () => {
    test('checkNumericArray', () => {
        expect(checkNumericArray([1,2,3])).toEqual([1,2,3]);
        expect(checkNumericArray([1,2,3], 3)).toEqual([1,2,3]);
        expect(() => checkNumericArray([1,2,3, 'a'])).toThrow(ArrayNotNumericError);
        expect(() => checkNumericArray([1,2,3], 2)).toThrow(ArrayUnexpectedLenError);
    });
    test('updateObject', () => {
        const obj1 = {
            a: '1',
            b: '2',
            c: {
                d: '4',
                e: '5'
            },
            f: {
                g: {
                    h: '8',
                    i: '9'
                },
                j: '10'
            }
        };
        const obj2 = {
            c: {
                d: '6',
                e: '7'
            },
            f: {
                g: {
                    i: '11',
                    h: '12'
                },
                j: '13'
            }
        };
        updateObject(obj1, obj2);
        expect(obj1).toEqual({
            a: '1',
            b: '2',
            c: {
                d: '6',
                e: '7'
            },
            f: {
                g: {
                    h: '12',
                    i: '11'
                },
                j: '13'
            }
        });
    });
    test('URLBuilder', () => {
        expect(URLBuilder('http://example.com', {
            name: 'john',
            last: 'doe',
            age: 20
        })).toEqual('http://example.com?name=john&last=doe&age=20');
        expect(URLBuilder('http://example.com?name=john&last=doe', {
            name: 'john',
            last: 'doe',
            age: 20
        })).toEqual('http://example.com?name=john&last=doe&age=20');
        expect(URLBuilder('http://example.com', {})).toEqual('http://example.com');
        expect(URLBuilder('http://example.com?name=john&last=doe', {})).toEqual('http://example.com');
    });
    test('objectsEqual', () => {
        const ref = {
            a: '1',
            b: '2',
            c: {
                d: '4',
                e: '5'
            },
            f: {
                g: {
                    h: '8',
                    i: '9'
                },
                j: '10'
            }
        };
        const comp = {
            c: {
                d: '6',
                e: '7'
            },
            f: {
                g: {
                    i: '11',
                    h: '12'
                },
                j: '13'
            }
        };
        expect(objectsEqual(ref, comp)).toBeFalsy();
        expect(objectsEqual(ref, ref)).toBeTruthy();
    });
});
