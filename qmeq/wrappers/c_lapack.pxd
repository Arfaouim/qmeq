import numpy as np
cimport numpy as np


cdef class LapackSolver:

    cdef int info

    cdef double* a_double
    cdef double* b_double

    cdef void solve(self)

    cdef void determine_pointer_a(self, a)
    cdef void determine_pointer_b(self, b)


cdef class LapackSolverXGESV(LapackSolver):

    cdef int n
    # a
    cdef int nrhs
    cdef int lda
    cdef int* ipiv
    # b
    cdef int ldb
    # info


cdef class LapackSolverDGESV(LapackSolverXGESV):
    pass


cdef class LapackSolverXGELSD(LapackSolver):

    cdef int m
    cdef int n
    cdef int nrhs
    # a
    cdef int lda
    # b
    cdef int ldb
    cdef double* s
    cdef double rcond
    cdef int rank
    cdef double* work
    cdef int lwork
    cdef int* iwork
    # info

    cdef int liwork

    cdef void determine_work_size(self)


cdef class LapackSolverDGELSD(LapackSolverXGELSD):
    pass
