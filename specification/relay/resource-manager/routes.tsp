// FIXME: Operations in this file are not detected as a resource operation, please confirm the conversion result manually

import "@azure-tools/typespec-azure-core";
import "@typespec/rest";
import "./models.tsp";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";

using TypeSpec.Rest;
using TypeSpec.Http;
using Azure.ResourceManager;
using TypeSpec.OpenAPI;

namespace Microsoft.Relay;

interface NamespacesOperationGroup {
  /**
   * Check the specified namespace name availability.
   */
  @operationId("Namespaces_CheckNameAvailability")
  @autoRoute
  checkNameAvailability is ArmProviderActionSync<
    Request = CheckNameAvailability,
    Response = CheckNameAvailabilityResult,
    Scope = SubscriptionActionScope,
    Parameters = {}
  >;
}

interface HybridConnectionsOperationGroup {
  /**
   * Authorization rules for a hybrid connection.
   */
  @operationId("HybridConnections_ListAuthorizationRules")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Relay/namespaces/{namespaceName}/hybridConnections/{hybridConnectionName}/authorizationRules")
  @get
  listAuthorizationRules(
    ...ApiVersionParameter,
    ...ResourceGroupParameter,

    /**
     * The namespace name
     */
    @maxLength(50)
    @minLength(6)
    @path
    namespaceName: string,

    /**
     * The hybrid connection name.
     */
    @minLength(1)
    @path
    hybridConnectionName: string,

    ...SubscriptionIdParameter,
  ): ArmResponse<ResourceListResult<AuthorizationRule>> | ErrorResponse;

  /**
   * Creates or updates an authorization rule for a hybrid connection.
   */
  @operationId("HybridConnections_CreateOrUpdateAuthorizationRule")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Relay/namespaces/{namespaceName}/hybridConnections/{hybridConnectionName}/authorizationRules/{authorizationRuleName}")
  @put
  createOrUpdateAuthorizationRule(
    ...ApiVersionParameter,
    ...ResourceGroupParameter,

    /**
     * The namespace name
     */
    @maxLength(50)
    @minLength(6)
    @path
    namespaceName: string,

    /**
     * The hybrid connection name.
     */
    @minLength(1)
    @path
    hybridConnectionName: string,

    /**
     * The authorization rule name.
     */
    @minLength(1)
    @path
    authorizationRuleName: string,

    ...SubscriptionIdParameter,

    /**
     * The authorization rule parameters.
     */
    @bodyRoot
    parameters: AuthorizationRule,
  ): ArmResponse<AuthorizationRule> | ErrorResponse;

  /**
   * Deletes a hybrid connection authorization rule.
   */
  @operationId("HybridConnections_DeleteAuthorizationRule")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Relay/namespaces/{namespaceName}/hybridConnections/{hybridConnectionName}/authorizationRules/{authorizationRuleName}")
  @delete
  deleteAuthorizationRule(
    ...ApiVersionParameter,
    ...ResourceGroupParameter,

    /**
     * The namespace name
     */
    @maxLength(50)
    @minLength(6)
    @path
    namespaceName: string,

    /**
     * The hybrid connection name.
     */
    @minLength(1)
    @path
    hybridConnectionName: string,

    /**
     * The authorization rule name.
     */
    @minLength(1)
    @path
    authorizationRuleName: string,

    ...SubscriptionIdParameter,
  ): OkResponse | ErrorResponse;

  /**
   * Hybrid connection authorization rule for a hybrid connection by name.
   */
  @operationId("HybridConnections_GetAuthorizationRule")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Relay/namespaces/{namespaceName}/hybridConnections/{hybridConnectionName}/authorizationRules/{authorizationRuleName}")
  @get
  getAuthorizationRule(
    ...ApiVersionParameter,
    ...ResourceGroupParameter,

    /**
     * The namespace name
     */
    @maxLength(50)
    @minLength(6)
    @path
    namespaceName: string,

    /**
     * The hybrid connection name.
     */
    @minLength(1)
    @path
    hybridConnectionName: string,

    /**
     * The authorization rule name.
     */
    @minLength(1)
    @path
    authorizationRuleName: string,

    ...SubscriptionIdParameter,
  ): ArmResponse<AuthorizationRule> | ErrorResponse;

  /**
   * Primary and secondary connection strings to the hybrid connection.
   */
  @operationId("HybridConnections_ListKeys")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Relay/namespaces/{namespaceName}/hybridConnections/{hybridConnectionName}/authorizationRules/{authorizationRuleName}/listKeys")
  @post
  listKeys(
    ...ApiVersionParameter,
    ...ResourceGroupParameter,

    /**
     * The namespace name
     */
    @maxLength(50)
    @minLength(6)
    @path
    namespaceName: string,

    /**
     * The hybrid connection name.
     */
    @minLength(1)
    @path
    hybridConnectionName: string,

    /**
     * The authorization rule name.
     */
    @minLength(1)
    @path
    authorizationRuleName: string,

    ...SubscriptionIdParameter,
  ): ArmResponse<AccessKeys> | ErrorResponse;

  /**
   * Regenerates the primary or secondary connection strings to the hybrid connection.
   */
  @operationId("HybridConnections_RegenerateKeys")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Relay/namespaces/{namespaceName}/hybridConnections/{hybridConnectionName}/authorizationRules/{authorizationRuleName}/regenerateKeys")
  @post
  regenerateKeys(
    ...ApiVersionParameter,
    ...ResourceGroupParameter,

    /**
     * The namespace name
     */
    @maxLength(50)
    @minLength(6)
    @path
    namespaceName: string,

    /**
     * The hybrid connection name.
     */
    @minLength(1)
    @path
    hybridConnectionName: string,

    /**
     * The authorization rule name.
     */
    @minLength(1)
    @path
    authorizationRuleName: string,

    ...SubscriptionIdParameter,

    /**
     * Parameters supplied to regenerate authorization rule.
     */
    @bodyRoot
    parameters: RegenerateAccessKeyParameters,
  ): ArmResponse<AccessKeys> | ErrorResponse;
}

interface WCFRelaysOperationGroup {
  /**
   * Authorization rules for a WCF relay.
   */
  @operationId("WCFRelays_ListAuthorizationRules")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Relay/namespaces/{namespaceName}/wcfRelays/{relayName}/authorizationRules")
  @get
  listAuthorizationRules(
    ...ApiVersionParameter,
    ...ResourceGroupParameter,

    /**
     * The namespace name
     */
    @maxLength(50)
    @minLength(6)
    @path
    namespaceName: string,

    /**
     * The relay name.
     */
    @minLength(1)
    @path
    relayName: string,

    ...SubscriptionIdParameter,
  ): ArmResponse<ResourceListResult<AuthorizationRule>> | ErrorResponse;

  /**
   * Creates or updates an authorization rule for a WCF relay.
   */
  @operationId("WCFRelays_CreateOrUpdateAuthorizationRule")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Relay/namespaces/{namespaceName}/wcfRelays/{relayName}/authorizationRules/{authorizationRuleName}")
  @put
  createOrUpdateAuthorizationRule(
    ...ApiVersionParameter,
    ...ResourceGroupParameter,

    /**
     * The namespace name
     */
    @maxLength(50)
    @minLength(6)
    @path
    namespaceName: string,

    /**
     * The relay name.
     */
    @minLength(1)
    @path
    relayName: string,

    /**
     * The authorization rule name.
     */
    @minLength(1)
    @path
    authorizationRuleName: string,

    ...SubscriptionIdParameter,

    /**
     * The authorization rule parameters.
     */
    @bodyRoot
    parameters: AuthorizationRule,
  ): ArmResponse<AuthorizationRule> | ErrorResponse;

  /**
   * Deletes a WCF relay authorization rule.
   */
  @operationId("WCFRelays_DeleteAuthorizationRule")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Relay/namespaces/{namespaceName}/wcfRelays/{relayName}/authorizationRules/{authorizationRuleName}")
  @delete
  deleteAuthorizationRule(
    ...ApiVersionParameter,
    ...ResourceGroupParameter,

    /**
     * The namespace name
     */
    @maxLength(50)
    @minLength(6)
    @path
    namespaceName: string,

    /**
     * The relay name.
     */
    @minLength(1)
    @path
    relayName: string,

    /**
     * The authorization rule name.
     */
    @minLength(1)
    @path
    authorizationRuleName: string,

    ...SubscriptionIdParameter,
  ): OkResponse | ErrorResponse;

  /**
   * Get authorizationRule for a WCF relay by name.
   */
  @operationId("WCFRelays_GetAuthorizationRule")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Relay/namespaces/{namespaceName}/wcfRelays/{relayName}/authorizationRules/{authorizationRuleName}")
  @get
  getAuthorizationRule(
    ...ApiVersionParameter,
    ...ResourceGroupParameter,

    /**
     * The namespace name
     */
    @maxLength(50)
    @minLength(6)
    @path
    namespaceName: string,

    /**
     * The relay name.
     */
    @minLength(1)
    @path
    relayName: string,

    /**
     * The authorization rule name.
     */
    @minLength(1)
    @path
    authorizationRuleName: string,

    ...SubscriptionIdParameter,
  ): ArmResponse<AuthorizationRule> | ErrorResponse;

  /**
   * Primary and secondary connection strings to the WCF relay.
   */
  @operationId("WCFRelays_ListKeys")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Relay/namespaces/{namespaceName}/wcfRelays/{relayName}/authorizationRules/{authorizationRuleName}/listKeys")
  @post
  listKeys(
    ...ApiVersionParameter,
    ...ResourceGroupParameter,

    /**
     * The namespace name
     */
    @maxLength(50)
    @minLength(6)
    @path
    namespaceName: string,

    /**
     * The relay name.
     */
    @minLength(1)
    @path
    relayName: string,

    /**
     * The authorization rule name.
     */
    @minLength(1)
    @path
    authorizationRuleName: string,

    ...SubscriptionIdParameter,
  ): ArmResponse<AccessKeys> | ErrorResponse;

  /**
   * Regenerates the primary or secondary connection strings to the WCF relay.
   */
  @operationId("WCFRelays_RegenerateKeys")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Relay/namespaces/{namespaceName}/wcfRelays/{relayName}/authorizationRules/{authorizationRuleName}/regenerateKeys")
  @post
  regenerateKeys(
    ...ApiVersionParameter,
    ...ResourceGroupParameter,

    /**
     * The namespace name
     */
    @maxLength(50)
    @minLength(6)
    @path
    namespaceName: string,

    /**
     * The relay name.
     */
    @minLength(1)
    @path
    relayName: string,

    /**
     * The authorization rule name.
     */
    @minLength(1)
    @path
    authorizationRuleName: string,

    ...SubscriptionIdParameter,

    /**
     * Parameters supplied to regenerate authorization rule.
     */
    @bodyRoot
    parameters: RegenerateAccessKeyParameters,
  ): ArmResponse<AccessKeys> | ErrorResponse;
}
