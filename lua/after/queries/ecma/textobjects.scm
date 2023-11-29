; extends
(object
  (pair
    key: (_) @property.lhs
    value: (_) @property.inner @property.rhs) @property.outer)

(object
  (shorthand_property_identifier) @property.outer)

(lexical_declaration
  (variable_declarator
    value: (function))) @function.outer

(lexical_declaration
  (variable_declarator
    value: (arrow_function))) @function.outer
