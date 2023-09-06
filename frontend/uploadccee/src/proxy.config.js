const PROXY_CONFIG = [
    {
      context: ['/api'],
      target: 'http://localhost:7388',
      changeOrigin: true,
      secure: false,
      pathRewriter : {
        "^/" : ""
      }
    }
  ];
  
  module.exports = PROXY_CONFIG;