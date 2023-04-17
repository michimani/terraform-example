package main

import (
	"context"
	"errors"

	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/evidently"
	"github.com/aws/aws-sdk-go-v2/service/evidently/types"
)

// Generate CloudWatch Evidently Client
func NewClient(ctx context.Context, region string) (*evidently.Client, error) {
	cfg, err := config.LoadDefaultConfig(ctx, config.WithRegion(region))
	if err != nil {
		return nil, err
	}

	return evidently.NewFromConfig(cfg), nil
}

func EvaluateFeature(ctx context.Context, client *evidently.Client, projectName string, featureName string, entityID string) (any, error) {
	if client == nil {
		return nil, errors.New("client is nil")
	}

	out, err := client.EvaluateFeature(ctx, &evidently.EvaluateFeatureInput{
		Project:  &projectName,
		Feature:  &featureName,
		EntityId: &entityID,
	})

	if err != nil {
		return nil, err
	}

	var value any
	switch out.Value.(type) {
	case *types.VariableValueMemberStringValue:
		value = out.Value.(*types.VariableValueMemberStringValue).Value
	case *types.VariableValueMemberBoolValue:
		value = out.Value.(*types.VariableValueMemberBoolValue).Value
	case *types.VariableValueMemberLongValue:
		value = out.Value.(*types.VariableValueMemberLongValue).Value
	case *types.VariableValueMemberDoubleValue:
		value = out.Value.(*types.VariableValueMemberDoubleValue).Value
	default:
		// noop
	}

	return value, nil
}
