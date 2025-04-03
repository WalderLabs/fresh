FROM denoland/deno

# Prefer not to run as root.
USER deno

EXPOSE 8000
WORKDIR /app
ADD . /app

# Cache the dependencies as a layer (the following two steps are re-run only when deps.ts is modified).
# Ideally cache deps.ts will download and compile _all_ external files used in main.ts.
#COPY deps.ts .
#RUN deno install --entrypoint deps.ts

# Add dependencies to the container's Deno cache
RUN deno cache main.ts
CMD ["task", "start"]
