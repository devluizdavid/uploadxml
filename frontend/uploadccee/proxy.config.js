const proxy = [
    {
      context: '/',
      target: 'http://localhost:7388',
      pathRewrite: {'^/' : ''}
    }
  ];
  module.exports = proxy;