import version from './package.json' assert { type: 'json' };

/**
 * Run `build` or `dev` with `SKIP_ENV_VALIDATION` to skip env validation.
 * This is especially useful for Docker builds and Linting.
 */
!process.env.SKIP_ENV_VALIDATION && (await import('./src/env.mjs'));

/** @type {import("next").NextConfig} */
const config = {
  /** Enables hot reloading for local packages without a build step */
  transpilePackages: ['@acme/api', '@acme/auth', '@acme/db'],
  /** We already do linting and typechecking as separate tasks in CI */
  eslint: { ignoreDuringBuilds: !!process.env.CI },
  typescript: { ignoreBuildErrors: !!process.env.CI },
  images: {
    domains: ['res.cloudinary.com'],
  },
  publicRuntimeConfig: {
    version,
  },
};

// webpack: (config, { isServer }) => {
//   if (!isServer) {
//     config.resolve.fallback = {
//       fs: false,
//     };
//   }
//   return config;
// },

export default config;
