function updateObject(a, b) {
    Object.entries(b).forEach(([k, v]) => {
        if (v) {
            if (Array.isArray(v)) {
                a[k] = v;  
            } else if (typeof v === 'object') {
                if (a[k] === undefined)
                    a[k] = {};
                updateObject(a[k], v);
            } else
                a[k] = v;
        }
    });
}

function URLBuilder(url, params) {
    const size = Object.keys(params).length;
    if (size > 0) {
        let retUrl = url;
        let i = 1;  
        Object.entries(params).forEach(([key, value]) => {
            retUrl += (i++ > 0 ? '&' : '?') + key + '=' + value;
        });
        return retUrl;
    }
    return url;
}


function checkNumericArray(array, length) {
    if (!Array.isArray(array)) 
        throw new NotAnArrayError();
    if (!array.every(i => typeof i === 'number'))  
        throw new ArrayNotNumericError();
    if (length && array.length !== length)
        throw new ArrayUnexpectedLenError(length, array.length);
    return array;
}


function objectsEqual(reference, comparison){
    return Object.keys(reference).every(k => {
        const val = comparison[k];
        if (Array.isArray(reference[k]) && Array.isArray(val)) {
            return reference[k].length === val.length;  
        } else if (typeof val === "object" && val !== null) {
            return objectsEqual(reference[k], val);
        }
        return reference[k] === val;
    });
}

class ArrayNotNumericError extends Error {
    constructor() {
        super();
        this.name = 'ArrayNotNumericError';
        this.message = 'ArrayNotNumericError';
    }
}

class ArrayUnexpectedLenError extends Error {
    constructor(expected, got) {
        super();
        this.name = 'ArrayUnexpectedLenError';
        this.message = 'ArrayUnexpectedLenError';
    }
}

module.exports = {
    updateObject,
    URLBuilder,
    checkNumericArray,
    objectsEqual,
    ArrayNotNumericError,
    ArrayUnexpectedLenError
}
