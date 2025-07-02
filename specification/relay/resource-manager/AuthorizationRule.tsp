import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";
import "@typespec/rest";
import "./models.tsp";
import "./RelayNamespace.tsp";

using TypeSpec.Rest;
using Azure.ResourceManager;
using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Microsoft.Relay;
/**
 * Single item in a List or Get AuthorizationRule operation
 */
@parentResource(RelayNamespace)
model AuthorizationRule
  is Azure.ResourceManager.ProxyResource<AuthorizationRuleProperties> {
  ...ResourceNameParameter<
    Resource = AuthorizationRule,
    KeyName = "authorizationRuleName",
    SegmentName = "authorizationRules",
    NamePattern = ""
  >;
}

@armResourceOperations
interface AuthorizationRules {
  /**
   * Authorization rule for a namespace by name.
   */
  getAuthorizationRule is ArmResourceRead<AuthorizationRule>;

  /**
   * Creates or updates an authorization rule for a namespace.
   */
  createOrUpdateAuthorizationRule is ArmResourceCreateOrReplaceSync<
    AuthorizationRule,
    Response = ArmResourceUpdatedResponse<AuthorizationRule>
  >;

  /**
   * Deletes a namespace authorization rule.
   */
  deleteAuthorizationRule is ArmResourceDeleteSync<AuthorizationRule>;

  /**
   * Authorization rules for a namespace.
   */
  listAuthorizationRules is ArmResourceListByParent<AuthorizationRule>;

  /**
   * Primary and secondary connection strings to the namespace.
   */
  listKeys is ArmResourceActionSync<
    AuthorizationRule,
    void,
    ArmResponse<AccessKeys>
  >;

  /**
   * Regenerates the primary or secondary connection strings to the namespace.
   */
  regenerateKeys is ArmResourceActionSync<
    AuthorizationRule,
    RegenerateAccessKeyParameters,
    ArmResponse<AccessKeys>
  >;
}

@@minLength(AuthorizationRule.name, 1);
@@doc(AuthorizationRule.name, "The authorization rule name.");
@@doc(AuthorizationRule.properties,
  "Properties supplied to create or update AuthorizationRule"
);
@@doc(AuthorizationRules.createOrUpdateAuthorizationRule::parameters.resource,
  "The authorization rule parameters."
);
@@doc(AuthorizationRules.regenerateKeys::parameters.body,
  "Parameters supplied to regenerate authorization rule."
);
