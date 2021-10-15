fs = require 'fs'
module.exports =
  config:
    SelectSyntax:
      type: 'string',
      default: 'fire-spring-syntax',
      enum: ['fire-spring-syntax',
      'fire-spring-darker-syntax',
      'earthbound-syntax',
      'earthbound-darker-syntax',
      'dusty-dunes-syntax',
      'dusty-dunes-darker-syntax',
      'magicant-syntax',
      'cave-of-the-past-syntax',
      'threed-syntax',
      'threed-darker-syntax',
      'moonside-syntax'
      ]

atom.config.onDidChange 'earthbound-themes-syntax.SelectSyntax', ({newValue, oldValue}) ->
    if (newValue)
        console.log(atom.packages.getPackageDirPaths() + '/earthbound-themes-syntax/themes/' + newValue + '/colors.less');
        fs.createReadStream(atom.packages.getPackageDirPaths() + '/earthbound-themes-syntax/themes/' + newValue + '/colors.less').pipe(fs.createWriteStream(atom.packages.getPackageDirPaths() + '/earthbound-themes-syntax/styles/colors.less'));
    else
        fs.createReadStream(atom.packages.getPackageDirPaths() + 'earthbound-themes-syntax/themes/fire-spring-syntax/colors.less').pipe(fs.createWriteStream(atom.packages.getPackageDirPaths() + '/earthbound-themes-syntax/styles/colors.less'));
