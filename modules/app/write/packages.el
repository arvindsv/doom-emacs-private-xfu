;; -*- no-byte-compile: t; -*-
;;; app/write/packages.el

(when (featurep! +langtool)
  (package! langtool))
(when (featurep! +wordnut)
  (package! wordnut))
(when (featurep! +osxdict)
  (package! osx-dictionary))
(when (featurep! +synosaurus)
  (package! synosaurus))

(package! mixed-pitch)
