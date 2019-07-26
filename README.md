# oracle-node

A node image with pre-installed Oracle&trade; Instant Client. For use with [node-oracledb](http://oracle.github.io/node-oracledb/).


## Building

1. Download the Oracle&trade Instant Client and SDK [here](http://www.oracle.com/technetwork/database/database-technologies/instant-client/overview/index.html). Store in the `instantclient` folder.
2. Update `build-list` if necessary. Each line is defined as
   ```
   node_tag build_tag synonymn_tags
   ```

   * `node_tag`: node version to pull
   * `build_tag`: tag to be used when running `docker build`
   * `synonymn_tags`: other tags to assign to the build. space separated.

3. Run `make all`

