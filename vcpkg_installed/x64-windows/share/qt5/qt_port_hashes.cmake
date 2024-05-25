# Every update requires an update of these hashes and the version within the control file of each of the 32 ports.
# So it is probably better to have a central location for these hashes and let the ports update via a script
set(QT_MAJOR_MINOR_VER 5.15)
set(QT_PATCH_VER 13)
set(QT_UPDATE_VERSION 0) # Switch to update qt and not build qt. Creates a file cmake/qt_new_hashes.cmake in qt5-base with the new hashes.

set(QT_PORT_LIST base 3d activeqt charts connectivity datavis3d declarative gamepad graphicaleffects imageformats location macextras mqtt multimedia networkauth
                 purchasing quickcontrols quickcontrols2 remoteobjects script scxml sensors serialport speech svg tools virtualkeyboard webchannel websockets
                 webview winextras xmlpatterns doc x11extras androidextras translations serialbus webengine webglplugin wayland)

set(QT_HASH_qt5-3d               30bb061b13f91a8137e961948431b0ca697135a62c8f601eb0c65dc46f0a1f3e7d850141952f0b673a80002e8493289860d9b86840406e3e72fab4eb515688ad)
set(QT_HASH_qt5-activeqt         09aaf289be9136762934358083819ff0f6ceccd2e56699184ea4787cc51d0173b2581f316c9181d21a05bc6d80992867b40677998d436e370666bcd090ce7a8b)
set(QT_HASH_qt5-androidextras    f5eae2dfd9ff92096b7b636ec3f23825d54303e2ebfd3f597ee9e7c5ecea3883cd8a11e81cba6d9a3e0d6884e60ff00551a51fc2c735d0ad5ca227de56850ff6)
set(QT_HASH_qt5-base             565632646b04eed525530a50f1228dd1aa3b8f1318485fa7cf6ad96eabdc2208ed1522b3fc174bd4797b7d51edff18ea1f91a82dd701379407b880f1dd0d16ef)
set(QT_HASH_qt5-charts           a4ebdb7577683a68c960fee649ffac543528791daa88fd412ab5fdda3765719921cd4daebc49395c4108a3da2bafdbf8e08008fcced4c18b4d1a3acedb377796)
set(QT_HASH_qt5-connectivity     631947135a362b5a417b84702b3755588e5c7fe1c9cca5b523c8d8ca340b42f929aaf58c49d8282ec46b85b58afe8f0f2600024875fb9a7bd1145566ca328966)
set(QT_HASH_qt5-datavis3d        ced9c6083ade43f43db2a86b20188a75a7028b7f89613a0d94ea48ec795b234af669caa45227cbbc7c2c3187b017fb5521c2d7c16834277d9dba1671afb00076)
set(QT_HASH_qt5-declarative      fd16159217f7526f6e56d1849ffb2d219e0bee48581e4a1d3bdec1602f884038f3747da68b8905a6858e6e8e03e18b9da4d598a154d4d0a11a62b818940d3113)
set(QT_HASH_qt5-doc              a9acd8ee19f1fe7f2f30865449b37c8c67a1cc7029fdbcc2d267932d1c73f4b0c478a9023fe724aed8269b22b63dce824624e9cbc5fd6b5f08a719a6007ff076)
set(QT_HASH_qt5-gamepad          03f403c0f966c95b0c64286c047c54bc09e49ad7029de8476d792cc240d0d8b78a426f98e6358376cfc2abcaefb2500ff2182414bd8c2244541b065220780f63)
set(QT_HASH_qt5-graphicaleffects ee2f4e24ced70c1531ceb310c90d6c0bb5300f527a247f07599467f355fb89a426cce6bacb25b77b6ec62f4e358d2345093343ad442acd182dcaca77e031a0bf)
set(QT_HASH_qt5-imageformats     48b0dac1acfdae1b090bc5d0054610f61290135363400a629ce3650cddd4c11f7bd95edd5bd1d36d758006a5fd54ded29f540a6e8dc675ca2e85d4ae169add50)
set(QT_HASH_qt5-location         37ccec9d9ce4ab59c0e4a2827c94d2e7247786fa53dc340539160631aaa9e5de02fbff1a5fadc5d96c64b2d9a81a5912a562beb6e4d0ec09186f8508626ade36)
set(QT_HASH_qt5-macextras        62603dee7741845ad4ecdfd8dd81042031851bebe3f13281bc9fb18c56cfd546abeba200f57e1ca0364d8271bd76a8e2180e2403270fec914ee04be7dfb4248d)
set(QT_HASH_qt5-mqtt             09476ce6922a89f513f588a15c4b664f637b2d6fa17545d2a6d8d176b6f32bf41263200f52e9755f5d4d349ac2662ead4efb2a8375a19005947228a6e64c8222)
set(QT_HASH_qt5-multimedia       fa70146275d03c1bb8da1930eb66a9bbbf2a6c25cb6e6204a58b8338f58e671634eab878e9bac785ae2394de7dc38d30025a4afe4d26060e2f23a44758b2e5a4)
set(QT_HASH_qt5-networkauth      939ee9759fa0584aab060f420bdd98a44c49d93291dabff74bd90536a4cbd666899d3c1e19b438c1c3333d7d3f374a7a3b0beb8728b69ef19b915d2496f3fba8)
set(QT_HASH_qt5-purchasing       0b6b81e0ba458a7dd51cd373f1c74e63a6577dbf28c0c660d47b43a00c53d4bb6e14592d2a9210d8b843abddf92f8012d188bfd374ec086776c19df82df5308d)
set(QT_HASH_qt5-quickcontrols    9d84b2a0b0c752df7dd735a29b04a2e6351e016bb693ace49d05b51754784f7da3e335e8da1070b2e31391a4dc35a55adb36286bb5ec4e29e608801fcd8d2bcc)
set(QT_HASH_qt5-quickcontrols2   0aae8d2f208a47c38f8604879a55e019b7b34a1f1202fa9b447a30753d540de9cdc3c7a8658c36a5d4c01596d2c8c65ba279d7c67e70c48a6ebdb5ad443ca8b0)
set(QT_HASH_qt5-remoteobjects    5bdcb7560f4b08e81b0646790c145598524e4e75888b96ffad2f19c51896fbbcc56d50ad24ae4072a87b63a494250dc30aca782bd093f4f49e649d670e557117)
set(QT_HASH_qt5-script           38060e3cece2819befa67e078eee6a4bcf9c0135015724af4786eb3190cb1bf6895dc5b8a919da83b6d0576d1aa109ab4050c997409c7f5eed52385ef325e2de)
set(QT_HASH_qt5-scxml            ba7c40b08951521e8d56372456c6e613a49cd2bc42d8def7b477e0334100dd741fb20a6ef9d860dba9be44547998eee6bea30de0f16f43b3152e51132bcb2d90)
set(QT_HASH_qt5-sensors          d6bd4fe02625272786f8c0f384ecce7497eebc3d691deaf9a42b9b221e4905715c7adb4e56fc04487b39f950b34f2239e8902e6e7880bf793461e808d6c9d245)
set(QT_HASH_qt5-serialbus        12e5580249f0d241b0536be8c4ab5a01eed722c9cbaaa4c052ecacb8e105c0d31f4e83e87fcf7f30711e48b0a6d0ee413bd837ea2bb7fbc41bddb7e6ab18ea22)
set(QT_HASH_qt5-serialport       5eab045b704f101f046880e57ff5f3c0f901867d092892939c0c20e54624f30b676802ec9535f3be39e9687497e28bfb71b560635b0cb38e241a225d377e74ee)
set(QT_HASH_qt5-speech           43b97ddc333d1c4a9715b1c306ced0506eb8faf69f1d22500b74e509d33b5a5cb9d0c166b9211a32a78eaba57925195d8ba0c39c8ae6a15551f841426294c75f)
set(QT_HASH_qt5-svg              17d13fdeec439c02e7b7e478527376da2d4efd65e019fb18822d3d7883cbf129eea2661c19e931e59280c3bda7233fa6cfd84c4d76365abc63814a80e99f2a65)
set(QT_HASH_qt5-tools            a73abba58c76a69e2208c4228bf115f2ef6173db8fa00df9302eb4c8f04ff04b64690367c31a680dba3b0b8865ef27343e8d7343f7f81954c39458c443fd3500)
set(QT_HASH_qt5-translations     5404c98ba6303986da0ffc5f715cf7024b724183e6f30b15bc9825cac2d1715239a4479093cb46239cceaa0a7468dd05e190cd0a6911b22f3628ff57ff3d8c57)
set(QT_HASH_qt5-virtualkeyboard  abe58c132c8bd23d29de1937e2f1fb6571aec829ce74f4904d322c4046d8c70b4b9b508930e4c681a8e30ff1d8a63c627cc3bec1560e83dada426c09d827ae29)
set(QT_HASH_qt5-wayland          1f5b5e911ad9026d08260e5ce15aad5c9167726ce42db85634392f1e49d545ca5bcd4e44304f1ff633ffe110712a2b5dad87de6cd89eb3b7e6c657fe260e388d)
set(QT_HASH_qt5-webchannel       f0c698aded46ae1f2932a79bdf9d5601466b7e88f6af96fe48d346144fd2e5bbaa81c7c6a82ed78fe8a0314218827704648741b0b47c0efefc31eb447643ad23)
set(QT_HASH_qt5-webengine        0c9aa844148e908c2eb5af93b51d2809f183f775d5760b4654f8f34ac825fd8b9d81a9b70cb9d79d16502bdce7bd6d77484c5b04797d99726f6ff5e9e40af03f)
set(QT_HASH_qt5-webglplugin      14de04d356fb1d3475f5630ecd020b1d5c1127e1bd1032a668b6e0bb6073b04225494cf8a45c62c6b02d95f64fa81d4c0598f7e3e6a39787eeb23096da351e5a)
set(QT_HASH_qt5-websockets       578ccdb69602f978b9a10c08045f3a6fd0fe2247c07703617c1a717dc8910b383bff4c1f6a8195643f0552cb707ece5eca4c7e7f4d90356c26a409a849200489)
set(QT_HASH_qt5-webview          886c46dfb2e66ceeeb423220b48e47bdc8968faf5b9553f9e206ddb84d201341c6ad49308740835de3f27960ef04276477df5a55faf9e3c4c68180ae96acbc6a)
set(QT_HASH_qt5-winextras        c0c7193f0f4c3011ff44eb98fbb66780d64037e0b8cd46554b57849e1a5e926b666263ab64bd3a1d8ff116b364425b077fae4c4d839c80d89bdf214f78fe8c65)
set(QT_HASH_qt5-x11extras        8fcaab6a1ba13798bb86c236102b2af932e46de25de3bddc11baff5175db65ab0bea123d5c8477fea36fe1075481c335dbf554165c22e43a3409706b5f330695)
set(QT_HASH_qt5-xmlpatterns      01a7e41c0fb8c97b72a503c5a8276f2a9744aac624be79c50d366a5229f91920d0827c36ee9e434c78ded4b1624c8491da08af36ccd9dedd59d0d0785a5bb776)

if(QT_UPDATE_VERSION)
    message(STATUS "Running Qt in automatic version port update mode!")
    set(_VCPKG_INTERNAL_NO_HASH_CHECK 1)
    if("${PORT}" MATCHES "qt5-base")
        function(update_qt_version_in_manifest _port_name)
            set(_current_control "${VCPKG_ROOT_DIR}/ports/${_port_name}/vcpkg.json")
            file(READ ${_current_control} _control_contents)
            #message(STATUS "Before: \n${_control_contents}")
            string(REGEX REPLACE "\"version.*\": \"[0-9]+\.[0-9]+\.[0-9]+\",\n" "\"version\": \"${QT_MAJOR_MINOR_VER}.${QT_PATCH_VER}\",\n" _control_contents "${_control_contents}")
            string(REGEX REPLACE "\n  \"port-version\": [0-9]+," "" _control_contents "${_control_contents}")
            #message(STATUS "After: \n${_control_contents}")
            file(WRITE ${_current_control} "${_control_contents}")
            configure_file("${_current_control}" "${_current_control}" @ONLY NEWLINE_STYLE LF)
        endfunction()

        update_qt_version_in_manifest("qt5")
        foreach(_current_qt_port_basename ${QT_PORT_LIST})
            update_qt_version_in_manifest("qt5-${_current_qt_port_basename}")
        endforeach()
    endif()
endif()
