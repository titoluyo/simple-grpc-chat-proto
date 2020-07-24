![CI](https://github.com/jocampo/simple-grpc-chat-proto/workflows/CI/badge.svg)

# Protocol Buffers

This folder contains the [Protobuf](https://developers.google.com/protocol-buffers/docs/overview) definitions for the communication between the client and server of our simple grpc chat app.

---
### Compiling the protobuf objects
#### Prerequisites
We're using the GitHub package registry, so you might need to do the following:
1) Create a personal Github access token: https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token
2) To authenticate by adding your personal access token to your ~/.npmrc file, edit the ~/.npmrc file for your project to include the following line, replacing TOKEN with your personal access token. Create a new ~/.npmrc file if one doesn't exist.
`//npm.pkg.github.com/:_authToken=TOKEN`
3) If you're forking this repo, you'll have to consider replacing the package scope in the following places:
   1) The `proto/npm/.npmrc` file
#### Compiling the protos into JS/TS definitions
1) cd into `proto/npm` and run `npm install`
2) run `npm run compileProto`
If you get a permissions issue, you might need to give the script permissions: `chmod +x ./compileProto.sh`
3) If everything worked properly, you should be able to see the `proto-objects.js` and `proto-objects.d.ts` files in the `proto/npm` folder.

#### Publishing your package to the Github Package Registry
This can be as simple as doing
1) `npm publish`

But if you're forking this repo, then you'll also have to replace the @scope in the following places for the publish command to work:
1) `proto/npm/package.json`
   1) The `name` should have the following format: `@user/repo`
   2) The `url` of the `repository` should be updated to reflect your fork.
2) `proto/npm/.npmrc`
   1) This file should have the following content: `registry=https://npm.pkg.github.com/USER` (replace USER with your GitHub username)