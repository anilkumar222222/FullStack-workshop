function myMap(arr, callback) {
  const result = [];
  for (let i = 0; i < arr.length; i++) {
    result[result.length] = callback(arr[i], i, arr);
  }
  return result;
}

function myFilter(arr, callback) {
  const result = [];
  for (let i = 0; i < arr.length; i++) {
    if (callback(arr[i], i, arr)) {
      result[result.length] = arr[i];
    }
  }
  return result;
}

function myReduce(arr, callback, initialValue) {
  let acc = initialValue;
  let startIndex = 0;

  if (acc === undefined) {
    acc = arr[0];
    startIndex = 1;
  }

  for (let i = startIndex; i < arr.length; i++) {
    acc = callback(acc, arr[i], i, arr);
  }

  return acc;
}

function myFind(arr, callback) {
  for (let i = 0; i < arr.length; i++) {
    if (callback(arr[i], i, arr)) return arr[i];
  }
  return undefined;
}

function myEvery(arr, callback) {
  for (let i = 0; i < arr.length; i++) {
    if (!callback(arr[i], i, arr)) return false;
  }
  return true;
}

function mySome(arr, callback) {
  for (let i = 0; i < arr.length; i++) {
    if (callback(arr[i], i, arr)) return true;
  }
  return false;
}

function myFlat(arr, depth = 1) {
  const result = [];
  (function flatHelper(a, d) {
    for (let i = 0; i < a.length; i++) {
      if (Array.isArray(a[i]) && d > 0) {
        flatHelper(a[i], d - 1);
      } else {
        result[result.length] = a[i];
      }
    }
  })(arr, depth);

  return result;
}


console.log(myMap([1, 2, 3], x => x * 2));           
console.log(myFilter([1, 2, 3, 4], x => x > 2));     
console.log(myReduce([1, 2, 3], (a, b) => a + b, 0)); 
console.log(myFind([1, 2, 3], x => x > 1));          
console.log(myFlat([1, [2, [3, [4]]]], 2));          