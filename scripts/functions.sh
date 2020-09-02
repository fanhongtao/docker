
run() {
  docker run --rm --entrypoint="" "${FULL}" "$@"
}

# runTestContainer $CONTAINER_NAME $TAG
runTestContainer() {
    docker run \
        -d \
        --rm \
        --name "${1}" \
        -v "$(pwd)/test-wiki:/wiki" \
        -p "127.0.0.1:3080:8080" \
        "gollumorg/gollum:${2}" \
        --port 8080 \
        --emoji

    until curl "http://127.0.0.1:3080/"; do sleep 1; done
}

createTestContainerName() {
    echo "gollum-test-$(date +%Y%m%d%H%M%S)"
}
