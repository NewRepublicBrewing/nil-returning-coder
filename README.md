nil-returning-coder
===================

This gem supplies an YAMLColumn coder that returns nil instead of a blank object.  Useful when the class you are serializing to/from does not allow uninitialized objects (such as a unit measurement)
