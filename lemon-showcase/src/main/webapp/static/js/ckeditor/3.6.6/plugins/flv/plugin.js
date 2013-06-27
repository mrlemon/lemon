CKEDITOR.plugins.add('flv',
{
    init: function(editor){        
        var pluginName = 'flv';        
        CKEDITOR.dialog.add(pluginName, this.path + 'dialogs/flvPlayer.js');
        editor.config.flv_path = editor.config.flv_path || ( this.path+'player.swf');
        editor.addCommand(pluginName, new CKEDITOR.dialogCommand(pluginName));        
        editor.ui.addButton('flv',
        {               
            label: '插入Flv视频',
            command: pluginName
        });
    }
});
