#!/bin/sh

phpcs $PHPCS_FLAGS \
  --extensions=php,module,inc,install,test,profile,theme,css,info,txt,md,yml \
  --exclude=Drupal.Commenting.ClassComment,Drupal.Commenting.DataTypeNamespace,Drupal.Commenting.DocComment,Drupal.Commenting.DocCommentAlignment,Drupal.Commenting.DocCommentStar,Drupal.Commenting.FunctionComment,Drupal.Commenting.HookComment,Drupal.Commenting.VariableComment,Drupal.InfoFiles.AutoAddedKeys \
  /app/