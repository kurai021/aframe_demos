var vocaloid_changer = document.getElementById('vocaloid_changer');

AFRAME.registerComponent('vocaloid', {
  schema: {},
  init: function(){
    var self = this;

    vocaloid_changer.addEventListener('change', function(){
      var music;
      var model;
      var model2;

      if(vocaloid_changer.value == 'miku'){
        $('a-entity[mmd]').remove();

        music = document.createElement("a-entity");
        music.setAttribute('mmd', 'audio:images/vocaloid_songs/world_is_mine.mp3; audioDelayTime:5.333333333333333; afterglow:2.0;');
        self.el.append(music);

        model = document.createElement("a-entity");
        model.setAttribute('mmd-model', 'model:/images/miku/miku_v3.pmx;vmd:/images/miku/world_is_mine.vmd;');
        music.append(model);

      }

      else if (vocaloid_changer.value == 'len-rin') {
        $('a-entity[mmd]').remove();

        music = document.createElement("a-entity");
        music.setAttribute('mmd', 'audio:images/vocaloid_songs/migikata_no_chou.mp3; audioDelayTime:5.333333333333333; afterglow:2.0;');
        self.el.append(music);

        model = document.createElement("a-entity");
        model.setAttribute('mmd-model', 'model:/images/rin/rin_2.pmx;vmd:images/rin/Rin_Migikata_no_chou.vmd;');
        music.append(model);

        model2 = document.createElement("a-entity");
        model2.setAttribute('mmd-model', 'model:/images/len/len_2.pmx;vmd:images/len/Len_Migikata_no_chou.vmd;');
        music.append(model2);

      }

      else {
        alert("imposible crear la entidad");
      }
    });
  }
});
