package main

import (
	"context"
	"fmt"
	"os"
)

const projectName = "dev-feature-flag-using-evidently-project"

func main() {
	region := os.Getenv("AWS_REGION")
	if len(region) == 0 {
		region = "ap-northeast-1"
	}

	args := os.Args[1:]

	if len(args) < 2 {
		fmt.Println("Usage: go run . <feature_name> <entity_id>")
		os.Exit(1)
	}

	featureName := args[0]
	entityID := args[1]

	client, err := NewClient(context.Background(), region)
	if err != nil {
		os.Exit(1)
	}

	value, err := EvaluateFeature(context.Background(), client, projectName, featureName, entityID)
	if err != nil {
		fmt.Println(err.Error())
		os.Exit(1)
	}

	fmt.Printf("feature: %s, value: %v\n", featureName, value)
}
