/* eslint-disable no-param-reassign */
module.exports = {
  lintOnSave: process.env.NODE_ENV !== 'production',
  transpileDependencies: [
    'vuetify',
  ],
  pwa: {
    name: 'StableManager',
  },
  chainWebpack: (config) => {
    config
      .plugin('html')
      .tap((args) => {
        args[0].title = 'StableManager';
        return args;
      });
  },
  devServer: {
    disableHostCheck: true,
  },
};
