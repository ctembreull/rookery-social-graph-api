## Graph DB-based Generic Social API

This work-in-progress product is an attempt to craft a more-or-less genericized API
with relevance to many social-networking scenarios. Because of the incredibly connected
nature of social networks, this product is designed to use a Graph database, instead of
the more common SQL or NoSQL types.

### Installation

Installation is highly specific at the moment and will become more generalized as this
codebase approaches production quality.

1. **Clone this repository**. It'll also be helpful to ensure you have RVM or your Ruby version management software of choice installed, with Ruby 2.2.2 available.

2. **Install Kitematic for Mac OS X**
Kitematic is a Docker helper app that takes the command-line hassle out of managing
Docker containers. It's free. Download it from [https://kitematic.com] (https://kitematic.com)

3. Find and install the `docker-neo4j:latest` image, from Kenny Bastani, and start it up. This should give you a copy of Neo4j ~> 2.3.0. Kitematic likes to set the ports strangely, in my case the server was running at http://192.168.99.100:32769. Whatever IP and port it gives you, paste it into config/initializers/neo4j_session.rb. `TODO: config-file that.`

4. From your cloned project directory, run `bundle install`

5. From your cloned project directory, run `bundle exec guard`

6. The API is now available at http://localhost:9200. You can also get a REPL environment by running `bin/console` from the project directory.
