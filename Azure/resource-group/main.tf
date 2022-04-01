terraform {
  required_providers {
    azurerm = "~> 2.93.0"
  }
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

# WIP - Policy to ensure all child elements under the RG share certain tags
// resource "azurerm_policy_definition" "policy" {
//   name         = "InheritResourceGroupTags"
//   policy_type  = "Custom"
//   mode         = "Indexed"
//   display_name = "acceptance test policy definition"

//   metadata = <<METADATA
//     {
//     "category": "General"
//     }

// METADATA
//   parameters = <<PARAMETERS
//     {
//     "tags": {
//         "type": "Array",
//         "metadata": {
//             "description": "The list of tags to be applied to the resource(s).",
//             "displayName": "Tags",
//             "strongType": "string"
//         }
//         "allowedValues": [
//           ${join(", ", var.tags.keys()}}
//         ]
//     }
//   }
// PARAMETERS

//   policy_rule = <<POLICY_RULE
//     {
//       "if": {
//         "anyOf": [
//           {
//             "field": "[concat('tags[', parameters('tagName1'), ']')]",
//             "exists": "false"
//           },
//           {
//             "field": "[concat('tags[', parameters('tagName2'), ']')]",
//             "exists": "false"
//           },
//           {
//             "field": "[concat('tags[', parameters('tagName3'), ']')]",
//             "exists": "false"
//           },
//           {
//             "field": "[concat('tags[', parameters('tagName4'), ']')]",
//             "exists": "false"
//           }
//         ]
//       },
//       "then": {
//         "effect": "modify",
//           "details": {
//             "roleDefinitionIds": [
//               "/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
//             ],
//             "operations": [
//               {
//                 "operation": "addOrReplace",
//                 "field": "[concat('tags[', parameters('tagName'), ']')]",
//                 "value": "[resourceGroup().tags[parameters('tagName')]]"
//               }
//             ]
//           }
//         }
//       }
// POLICY_RULE


//   parameters = <<PARAMETERS
//     {
//     "allowedLocations": {
//       "type": "Array",
//       "metadata": {
//         "description": "The list of allowed locations for resources.",
//         "displayName": "Allowed locations",
//         "strongType": "location"
//       }
//     }
//   }
// PARAMETERS

// }
