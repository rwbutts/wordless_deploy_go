# syntax=docker/dockerfile:1

# Deploy the application binary into a lean image
FROM gcr.io/wordless-412000/github.com/rwbutts/wordless_api_go:latest

WORKDIR /

COPY --from=build-stage /wordless /wordless
COPY --from=gcr.io/wordless-412000/github.com/rwbutts/wordless_vue_dist:latest /dist/ /wwwroot/

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/wordless"]

