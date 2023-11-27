/**
 * Merges properties from object `b` into object `a` recursively. If a property in `b` is an object, 
 * it will be deeply merged into the corresponding property of `a`. Non-object properties are copied directly.
 * Note: This function mutates the object `a`.
 *
 * @param {Object} a - The target object to which properties are added or updated.
 * @param {Object} b - The source object from which properties are copied.
 */
function updateObject(a, b) {

}

/**
 * Constructs a URL with query parameters appended. It takes a base URL and an object representing query parameters.
 * Each key-value pair in the parameters object is added to the URL as query strings.
 * If the parameters object is empty, the base URL is returned unchanged.
 *
 * @param {string} url - The base URL to which query parameters are appended.
 * @param {Object} params - An object representing query parameters as key-value pairs.
 * @returns {string} - The URL constructed with the appended query parameters.
 */
function URLBuilder(url, params) {

}

/**
 * Validates if the given input is an array of numeric values. Optionally checks if the array's length matches a specified value.
 * Throws an error if the input is not an array, contains non-numeric values, or doesn't match the expected length.
 *
 * @param {Array} array - The array to be validated.
 * @param {number} [length] - Optional. The expected length of the array.
 * @throws {NotAnArrayError} If the input is not an array.
 * @throws {ArrayNotNumericError} If the array contains non-numeric values.
 * @throws {ArrayUnexpectedLenError} If the array's length does not match the specified length.
 * @returns {Array} - The validated numeric array.
 */
function checkNumericArray(array, length) {

}

/**
 * Compares two objects for equality. Determines if every property of the reference object 
 * matches the corresponding property in the comparison object. This comparison is done recursively
 * for properties that are objects. Non-object properties are compared with strict equality.
 *
 * @param {Object} reference - The reference object for comparison.
 * @param {Object} comparison - The object to compare against the reference object.
 * @returns {boolean} - `true` if the objects are equal, `false` otherwise.
 */
function objectsEqual(reference, comparison){

}

module.exports = {
    updateObject,
    URLBuilder,
    checkNumericArray,
    objectsEqual
}
