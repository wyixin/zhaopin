define([],function () {
  return function () {
    AV.initialize(
      'hkvqbh84v4aeta0pgay00qwws1bejf0g6xx7g2i2guoeji36',
      'ob1p5yatuw3do7jkuf9bqfpl1r4ohbe1lu4ioq2u21xzv9od'
    );
    var User = AV.Object.extend('MockUser');

    var convsId = [
      '000000000000000000000000',
      '5551b3b5e4b0de73eec89ea4',
      '5551b3c7e4b08d44495b6968',
      '5551b278e4b06c79132778db',
      '5551b21fe4b0491015852ac2',
      '5551b0e0e4b06c791327686b',
      '5551b07ce4b06c7913276410',
      '5551af4ae4b0fcd9cb376e88',
      '5551aee6e4b0270647be553c',
      '5551adb4e4b0fcd9cb37649c'
    ]

    var girl1 = User.new();
    girl1.save({
      clientId: 'gril1',
      convsId: [convsId[1], convsId[2], convsId[3]]
    });

    var girl2 = User.new();
    girl2.save({
      clientId: 'girl2',
      convsId: [convsId[4],convsId[5],convsId[6]]
    });

    var girl3 = User.new();
    girl3.save({
      clientId: 'girl3',
      convsId: [convsId[7],convsId[8],convsId[9]]
    });

    var guy1 = User.new();
    guy1.save({
      clientId: 'guy1',
      convsId: [convsId[1], convsId[4], convsId[7]]
    });

    var guy2 = User.new();
    guy2.save({
      clientId: 'guy2',
      convsId: [convsId[2], convsId[5], convsId[8]]
    });

    var guy3 = User.new();
    guy3.save({
      clientId: 'guy3',
      convsId: [convsId[3], convsId[6], convsId[9]]
    });

  }

});
