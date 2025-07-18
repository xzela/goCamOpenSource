FROM node:20 AS base

# Create app directory inside of docker
WORKDIR /usr/src/app

# Copy package files for install
COPY package*.json ./
RUN npm ci


# Copy entry point for quality of life reason
COPY docker/entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

# Bundle app source
COPY . .
# Copy the Docker specific env file (in case folks run this outside of compose)
COPY docker/.env.docker .env

EXPOSE 3300

ENTRYPOINT [ "./entrypoint.sh" ]
