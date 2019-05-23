#pragma once
#include "vec3.cuh"
#include <curand_kernel.h>
#include <random>

namespace ppt
{
namespace shared
{

#define RANDVEC3 \
    vec3(curand_uniform(local_rand_state), curand_uniform(local_rand_state), curand_uniform(local_rand_state))

__device__ vec3 random_in_unit_sphere(curandState* local_rand_state)
{
    vec3 p;
    do
    {
        p = RANDVEC3 * 2.0f - vec3(1.0f, 1.0f, 1.0f);
    } while (p.squared_length() >= 1.0f);
    return p;
}

} // namespace shared
} // namespace ppt