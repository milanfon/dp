const {updateObject, URLBuilder, checkNumericArray, objectsEqual, ArrayNotNumericError} = require('../inputs/js');

describe('updateObject', () => {
  it('should not shallow copy arrays', () => {
    let target = {};
    let source = { arrayProperty: [1, 2, 3] };
    updateObject(target, source);
    source.arrayProperty.push(4);

    expect(target.arrayProperty).not.toEqual(source.arrayProperty);
  });
});

describe('URLBuilder', () => {
  it('should correctly append query parameters', () => {
    let url = "http://example.com";
    let params = { param1: 'value1', param2: 'value2' };
    let builtUrl = URLBuilder(url, params);

    expect(builtUrl).toBe("http://example.com?param1=value1&param2=value2");
  });
});

describe('checkNumericArray', () => {
  it('should not accept string representations of numbers', () => {
    let array = [1, "2", 3];

    expect(() => checkNumericArray(array)).toThrow(ArrayNotNumericError);
  });
});

describe('objectsEqual', () => {
    it('should correctly compare array properties', () => {
        let obj1 = { a: [1, 2, 3] };
        let obj2 = { a: [4, 5, 6] };  // Different contents, same length

        expect(objectsEqual(obj1, obj2)).toBe(false);
    });
});
