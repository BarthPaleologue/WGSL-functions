fn adjoint(matrix: mat4x4<f32>) -> mat4x4<f32> {
    let a00: f32 = matrix[0][0];
    let a01: f32 = matrix[0][1];
    let a02: f32 = matrix[0][2];
    let a03: f32 = matrix[0][3];
    let a10: f32 = matrix[1][0];
    let a11: f32 = matrix[1][1];
    let a12: f32 = matrix[1][2];
    let a13: f32 = matrix[1][3];
    let a20: f32 = matrix[2][0];
    let a21: f32 = matrix[2][1];
    let a22: f32 = matrix[2][2];
    let a23: f32 = matrix[2][3];
    let a30: f32 = matrix[3][0];
    let a31: f32 = matrix[3][1];
    let a32: f32 = matrix[3][2];
    let a33: f32 = matrix[3][3];

    // https://semath.info/src/inverse-cofactor-ex4.html
    let b00: f32 = a11 * a22 * a33 + a12 * a23 * a31 + a13 * a21 * a32         - a13 * a22 * a31 - a12 * a21 * a33 - a11 * a23 * a32;
    let b01: f32 = -a01 * a22 * a33 - a02 * a23 * a31 - a03 * a21 * a32         + a03 * a22 * a31 + a02 * a21 * a33 + a01 * a23 * a32;
    let b02: f32 = a01 * a12 * a33 + a02 * a13 * a31 + a03 * a11 * a32         - a03 * a12 * a31 - a02 * a11 * a33 - a01 * a13 * a32;
    let b03: f32 = -a01 * a12 * a23 - a02 * a13 * a21 - a03 * a11 * a22        + a03 * a12 * a21 + a02 * a11 * a23 + a01 * a13 * a22;

    let b10: f32 = -a10 * a22 * a33 - a12 * a23 * a30 + a13 * a20 * a32        + a10 * a23 * a32 + a12 * a20 * a33 - a13 * a22 * a30;
    let b11: f32 = a00 * a22 * a33 + a02 * a23 * a30 + a03 * a20 * a32        - a00 * a23 * a32 - a02 * a20 * a33 - a03 * a22 * a30;
    let b12: f32 = -a00 * a12 * a33 - a02 * a13 * a30 - a03 * a10 * a32        + a00 * a13 * a32 + a02 * a10 * a33 + a03 * a12 * a30;
    let b13: f32 = a00 * a12 * a23 + a02 * a13 * a20 + a03 * a10 * a22        - a00 * a13 * a22 - a02 * a10 * a23 - a03 * a12 * a20;

    let b20: f32 = a10 * a21 * a33 + a11 * a23 * a30 + a13 * a20 * a31        - a10 * a23 * a31 - a11 * a20 * a33 - a13 * a21 * a30;
    let b21: f32 = -a00 * a21 * a33 - a01 * a23 * a30 - a03 * a20 * a31        + a00 * a23 * a31 + a01 * a20 * a33 + a03 * a21 * a30;
    let b22: f32 = a00 * a11 * a33 + a01 * a13 * a30 + a03 * a10 * a31        - a00 * a13 * a31 - a01 * a10 * a33 - a03 * a11 * a30;
    let b23: f32 = -a00 * a11 * a23 - a01 * a13 * a20 - a03 * a10 * a21        + a00 * a13 * a21 + a01 * a10 * a23 + a03 * a11 * a20;

    let b30: f32 = -a10 * a21 * a32 - a11 * a22 * a30 + a12 * a20 * a31        + a10 * a22 * a31 + a11 * a20 * a32 - a12 * a21 * a30;
    let b31: f32 = a00 * a21 * a32 + a01 * a22 * a30 + a02 * a20 * a31        - a00 * a22 * a31 - a01 * a20 * a32 - a02 * a21 * a30;
    let b32: f32 = -a00 * a11 * a32 - a01 * a12 * a30 - a02 * a10 * a31        + a00 * a12 * a31 + a01 * a10 * a32 + a02 * a11 * a30;
    let b33: f32 = a00 * a11 * a22 + a01 * a12 * a20 + a02 * a10 * a21        - a00 * a12 * a21 - a01 * a10 * a22 - a02 * a11 * a20;

    return mat4x4<f32>(
        b00, b01, b02, b03,
        b10, b11, b12, b13,
        b20, b21, b22, b23,
        b30, b31, b32, b33
    );
}


fn inverse(matrix: mat4x4<f32>) -> mat4x4<f32> {
    let det: f32 = determinant(matrix);
    if (det == 0.0) {
        return mat4x4<f32>();
    } else {
        return adjoint(matrix) * (1.0 / det);
    }
}