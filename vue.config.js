const ImageminPlugin = require('imagemin-webpack-plugin').default;
// eslint-disable-next-line @typescript-eslint/no-var-requires
const imageminMozjpeg = require('imagemin-mozjpeg');

/* eslint-disable no-param-reassign */
module.exports = {
  lintOnSave: process.env.NODE_ENV !== 'production',
  transpileDependencies: [
    'vuetify',
  ],
  pwa: {
    name: 'StableManager',
    manifestOptions: {
      // eslint-disable-next-line @typescript-eslint/camelcase
      start_url: '/',
    },
    workboxPluginMode: 'InjectManifest',
    workboxOptions: {
      swSrc: 'src/service-worker.js',
      exclude: [
        /\.map$/,
        /manifest\.json$/,
      ],
    },
  },
  chainWebpack: (config) => {
    config
      .plugin('html')
      .tap((args) => {
        args[0].title = 'StableManager';
        return args;
      })
      .end()
      .plugin('imagemin-webpack-plugin')
      .use(ImageminPlugin, [{
        disable: process.env.NODE_ENV !== 'production',
        test: /\.(jpe?g|png|gif|svg)$/i,
        jpegtran: { progressive: true },
        plugins: [
          imageminMozjpeg({
            quality: 25,
            progressive: true,
          }),
        ],
      }]);
  },
  devServer: {
    disableHostCheck: true,
  },
};
