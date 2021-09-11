const path = require('path');
module.exports = {
    // context: __dirname,
    entry: "./widgets.jsx",
    output: {
        path: path.resolve(__dirname),
        filename: "bundle.js",
    },
    module: {
        rules: [
            {
                test: /\.jsx?$/,
                exclude: /(node_modules)/,
                use: {
                    loader: "babel-loader",
                    options: {
                        presets: [
                            ["@babel/preset-env", { targets: "defaults" }],
                            ["@babel/react", { targets: "defaults" }],
                        ],
                    },
                },
            },
        ],
    },
    devtool: "source-map",
    resolve: {
        extensions: [".js", ".jsx", "*"],
    },
};