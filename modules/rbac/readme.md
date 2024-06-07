Azure RBAC Module
This Terraform module manages Role-Based Access Control (RBAC) in Azure by creating or referencing an Azure Active Directory (AD) group and assigning specified roles to the group at a given scope.

Features
Creates a new Azure AD group or references an existing one.
Assigns specified roles to the Azure AD group at a specified scope.
Supports flexible configuration through input variables.

Inputs AZ RBAC Config
Name	Description	Type	Default	Required
group_name	The name of the Azure AD group.	string		Yes
create_group	Flag to determine whether to create a new group or use an existing one.	bool	true	No
roles	A map of roles to assign to the group, where keys are identifiers and values are role names.	map(string)		Yes
scope	The scope at which the role assignments apply.	string		Yes

Outputs
Name	Description
group_id	The ID of the Azure AD group.
role_assignments	Details of the role assignments.
