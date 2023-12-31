

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `veterinaria`
--

DROP DATABASE IF EXISTS veterinaria;
CREATE DATABASE veterinaria;
USE veterinaria;

DROP USER IF EXISTS 'admin'@'localhost';
DROP USER IF EXISTS 'vet'@'localhost';
DROP USER IF EXISTS 'receptionist'@'localhost';
DROP USER IF EXISTS 'billing'@'localhost';
DROP USER IF EXISTS 'guest'@'localhost';

-- User 1: Administrator (full privileges)
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin_pass';
GRANT ALL PRIVILEGES ON veterinaria.* TO 'admin'@'localhost';

-- User 2: Veterinarian (select, insert, update)
CREATE USER 'vet'@'localhost' IDENTIFIED BY 'vet_pass';
GRANT SELECT, INSERT, UPDATE ON veterinaria.* TO 'vet'@'localhost';

-- User 3: Receptionist (select, insert)
CREATE USER 'receptionist'@'localhost' IDENTIFIED BY 'receptionist_pass';
GRANT SELECT, INSERT ON veterinaria.* TO 'receptionist'@'localhost';

-- User 4: Billing (select)
CREATE USER 'billing'@'localhost' IDENTIFIED BY 'billing_pass';
GRANT SELECT ON veterinaria.* TO 'billing'@'localhost';

-- User 5: Guest (no database access)
CREATE USER 'guest'@'localhost' IDENTIFIED BY 'guest_pass';


--
-- Estructura de tabla para la tabla `detallehistorial`
--

DROP TABLE IF exists `veterinaria`.detallehistorial;
CREATE TABLE veterinaria.`detallehistorial` (
  `idHistorial` int(11) NOT NULL,
  `idVeterinario` int(11) NOT NULL,
  `fechaHistorial` date NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `tratamiento` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--
DROP TABLE IF exists veterinaria.historial;
CREATE TABLE `veterinaria`.`historial` (
  `idHistorial` int(11) NOT NULL,
  `idVeterinario` int(11) NOT NULL,
  `idMascota` int(11) NOT NULL,
  `fechaHistorial` date NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `tratamiento` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `veterinaria`.`historial` (`idHistorial`, `idVeterinario`, `idMascota`, `fechaHistorial`, `descripcion`, `tratamiento`) VALUES
(16, 1, 12, '2023-10-04', 'prueba', 'prueba'),
(17, 4, 13, '2023-10-07', 'duerme mucho', 'pastilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--
DROP TABLE IF exists veterinaria.mascota;
CREATE TABLE `veterinaria`.`mascota` (
  `idMascota` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `nombreMascota` varchar(50) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `razaMascota` varchar(20) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `sexo` char(1) NOT NULL,
  `foto` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `veterinaria`.`mascota` (`idMascota`, `idUsuario`, `nombreMascota`, `fechaNacimiento`, `razaMascota`, `descripcion`, `sexo`, `foto`) VALUES
(12, 18, 'layca', '2023-10-02', 'pastor aleman', 'nueva des', 'm', 0x89504e470d0a1a0a0000000d49484452000000c4000000f40803000000f30279f40000000467414d410000b18f0bfc6105000000017352474200aece1ce9000002fa504c544547704cbdbdbdc5c5c5b9b9bab6b6b6babababcbcbcbfbfbfc5c5c5bebebec3c3c3c5c5c5ccccccc8c8c8ccccccd6d6d6c0c0c0cacacad5d5d5d8d8d8dfdfdfd3d3d4c0c0c1b5b5b6ebebebc8c8c8dadadad8d8d8d9d9dac7c7c7b8b8b8a7a7a7e1e1e1d7d7d8d9d9d9dcdcdce8e8e8a1a1a1ededede9e9eacacacac1c1c1d9d9d9b9b9b9d9d9d9e9e9e9e1e1e1dfdfe0e5e5e5cfcfcfcbcbcbdcdcdce3e3e3b9b9b9e0e0e0d8d8d8e3e3e4bdbdbddadadaeaeaebcbcbcbdbdbdce8e8e8c2c2c2d8d8d8c3c3c3cacacac8c8c8dbdbdbaaaaaae6e6e6bbbbbbb5b5b5c8c8c8cacacaf2f2f2e5e5e6a4a4a4cdcdcdb1b1b1eaeaeac6c6c6c1c1c1e3e3e3dadadab6b6b6ededeecccccccfcfcfe1e1e1bebebebbbbbbc8c8c8bababaa7a7a7b0b0b0e5e5e6fbfbfbfefefefbfbfbe1e1e2dddddddfdfdfe1e1e2c1c1c1dededeeaeaeae8e8e9e3e3e3c6c6c6d5d5d5e3e3e3e3e3e3eaeaeaafafafd4d4d4d7d7d8ddddddcfcfcfbebebee0e0e1bbbbbbd0d0d0afafafbabababbbbbbd2d2d3c9c9c9b3b3b3b5b5b5d8d8d7d8d8d8eaeaeafffffffefefefefefeeaeaebaaaaaaeeeeeee7e7e7b5b5b5d9d9d9e4e4e5e2e2e2dbdbdbd8d8d8d8d8d8e8e8e9cececebababac6c6c6dededeb9b9b9c0c0c0c3c3c3a7a7a7bababadededec4c4c4d5d5d5f6f6f6f0f0f0fefefef2f2f2ffffffb9b9bbd7d7d7eeeeeebcbcbcf3f3f3adadadacacacdfdfdfb2b2b2c5c5c5c5c5c5e7e7e8f3f3f3e0e0e0a5a5a5d0d0d0ccccccbdbdbdf4f4f4fffffffefefefffffff5f5f5ffffffffffffffffffffffffececedc9c9c9d2d2d2e7e7e8a8a8a8cececeffffffffffffffffffd9a6e7e7e7e8d9d9d9a6a6a6e6e6e7a5a5a5d8d8d8a7a7a7e5e5e6d6d6d6a2a2a2d7d7d7fefefea1a1a1ffffffa0a0a09f9f9fa4a4a4a3a3a3e8e8e9dbdbdcededeeebebece9e9eaaeaeaed8d8d7e0e0e1fdfdfdacacacdddddea9a9a9b2b2b2dfdfdfbfbfbfe4e4e5e3e3e4e1e1e1bab6c3e2e2e3bababab7b7b7c3c3c3f8f8f8d1d1d2c7c7c8f0f0f1e1e1e2cbcbcce6e6e6f3f3f3cdcdcdd8d8d9a6a6a7a66f33a3000000c974524e53000e0314100b180205081c2f23105dfe1f381c175f3c341dcf5510f949292ced1f262be38bfaddf645414324f184c069e98951eab3b93b38955c52c16d9e6ca26b3c7ea0fbf4e3e3df91873cfef214d69797508133d1b4774aacac4964d4fbe6f6887961e3d5cbceb7dabcfea076654c7957dd7f8bf830c7552892f0c772daa9eff4cec417b297e6eee0a5cbc894f0d8f4acb9e89966baf0fad6def786c0c678c2e4592df89ee59f927ae5f571e8b1cea772b9e7a1aff4428d4adf34bcaba5d1f0e9b9fbc7f7c6e3d4ca84278d00000fb04944415478daed9d097414451ac73b934c329384907084842380842344ee2b1c722ab74160b9414e51511450110105414545116f5954bcaff5daf53e5677d7bd5ecff4f4f491ce5c31c31148487c100401dd7d6fab7a12329d4ccf74f594dd1537df03cc7bc430bff9be7fd5bfbeeaaaa1a896688996688996f8bf8ea4c4446bf37df52989690bc71fbafde69b8be66ec94ab53547047bdaa1bf7d5ae11224afd723382bfe9adf39d5d2dcb29076fb149757f0b99c6e104e97cf2355ec1a9bdcac1892c74f016fbfdbd9106ea7cfe3dedd39a9f954529f4f040112b81a20c0976e97a7323fbd993064deb6cda300b8c4e1167c4337378b1175e18b1e9f3b0203c470bbbcbb7e473e43dad683920a422819dedd69842324662cf382b75b8d41a6f07c984a3443d6277e413d0d75142ee7581bc9827ecfeb8c8e20eb42fa7404b1e3ea60754137a2f02e2274d62b9c7695a4050186af620b91e3eae07940d01a19402afe44602aba8cf3095a1160f80ff725ce282d5dee059ec28910c25c3b5108b60937487e94344037e8d99d48d4b83af12a8f130d0166e2b92ee42024e42ed32ee8f0f1e90439a2489be4937420c0ccb52345d063de431574c3f844068425eb196441878962001169d02568a220ac7d96797d6efd0c249453e63497140f82d3e51a65f6ca27772a5cf938e30897dbdca5b625fb7d41882b0db09aa6649a2ae8f57109ba2e0f9ec7134c1474c19d1e5fbc6980de69bc9982be568a1f01a4625b7bd3d230676af45686f66a7ad42c139bb7d82fe04803f47f260db00963b6c52de84bed8e8f4d599d5a266cc721e8bac6d372537c78f2f48312a64a826d824326ac4ded4ba6ea5af9a8a97aab096dccbbc66113b42c881dc6af4cade8ad0c67d476f20ec35d9325fbce38563e4d199c3d0719be559438f15a0f4604b7b0e916a337edec05cbf0095ade259a9d65741a3ae86d65a8a4419a67781aac23dfc12a685fd7ad866f73e50dc32b68cf0d0b8dde1e4abafb2026a3144a837fd3985646a7217b9ed78751d04eef24c3e7860e6fb9f00afa910ca32bc9ba64135641bbae9e6ef8f476d73041c02ae8617d28c3057d155e413f34c6f0ae46de3c0f5e41bf9e6df8cae72d2756410bb3328c7ed4ccbe64399656465dab15087a9ae14dbe0e8b71ae7ce0b86abca09ffe035641fbbaae375ed0cb700a1a8cab8b0d1774d2f39805fdd052e3053d15afa07b8e33bc1150885bd0b30c374a40d05eac82be7abae13da5bced98573ec30a1adbc9e42ed9eddb676d4e6f95f06b09da8db795d175a2620d9d5238beff1056e441888e35f9c38bf1cbdd5630156b2bc3d973b1620d6de9b396e5459675c8c182af1f7b371df311840ee330b73266dda21074b775e0ed5706cb3ffb7637acad8c6d785b19573fd546f10ff4eb2423b0610832c6e48dd8b49187b937e9d9de59f1f32f7b8c5700347088e2ca367804bdfe04de954fd7418a5686fd1a9e8dc410c2e01f684ba0a0bd372876422db70e115510ea285615c72f68ccad8c4de315db3e6de78334b06a0c218ad5b63805bd136f2ba3e76c652b63ecfe2869a8a360ef98119751ba53c06b94e629b772bbefe56320c814628e7e71272da8c02d684575dbe471351603fc0e7e758a4e414f988277e50304ad7829ed1fe3b520c81803bbeb6b654cc22b68e19ddb14d356f1cdad59cd0c0efe8f3ab46dcdbd17f3ca6787f20993764344ad0830c481e8aae8f2226641cf1aafb072e9fd79140448f119eaee21664103a3a4e8d4db36741211191cfc4a3bda0c8d59d09e61a3140b83116b51d300a2752f1423983e29bc95e16afc8a74ac7cd62b9e90292eeac4a23338d82bb53b286b4698a0ebfef40b8224087e97f3bfa818722b6382e21f1875a3a80301fe2f9769de6cf820ac9501fe03ce15bb4e54d69e3e79fa74a5db27f990b2116a65284a397d68eba846291a85c6738f49630e37b432a0200577ed39fe3c430783c10073943f73d82fc00153b3a07bce56b4886d0386e84b833c3c0dd7f45446c1018f3f3c0d52c5b9e381f260806660d08160b0fa6cadcfaf2d1950d08f2c54ccd09bfbf3ba110084161398fc945b0a4370fb5d27cf9707188e090b3a18e02b05576c0a59d0d315824ee877b9180783838d9d09fb9c7bc3563e300d95ff290f40029aa143c1c81909d217dcfe581470e5b3bd8fc228f4bd319e34c0ee474c61173e137e620cbcd5fe337490832f9b0e0b46e6287754f8a3ae30a0a0bb4ecfd46b94d486d818be2369e9e1f0950f60f05d28a71b23d46370c1a395827a2ee0cac7bbfb95fbc205bdb187181f02344f09d11fb33aa06865802ffcbf9433911842185cf0fc61d58a8282deb9f2ab3006cbab2fc105685c08c0c63e1c8d2175fab59e46770308e7cac3b41089a2ea842f22051c10a45dab5e99d100d1f6f3fd71a70166624bb471754aa3560660381d54670851949ff5ab09fade971e58b9eaab8e753fbfe32b93790c08e027a84bc236c6dd68e5e30227daaa025118e8d02075526a226ef95a847ffcf3fe3f3fb0fa55d9e858ee9bf152bc82aeafa63755d7a70913055f93d7225c28e7a231c8836da0a6a25141c982ae0deef9f2df5f7fbe7a46b7b6ddbabdfac5fd5762494354d3615dd064e27281f3b61c7cafe9e814a0a08426e3aa9b2f2d3df6dabfbefd66e5eacf667cb1eafe7d3c8b85012462be5a7bdc32d81761f2157e29bf183d11a18a0a9e16c24765b7df73f227c0505af2da9e6f41457df3f5cbac88270d6068dbaf9a88ec9d11262d5fc5a900138b412ea8a36e57d80cefada8020825a5252525201b7bbedc731c5725c96d02354524bfef8da04de96490890d2117d42f5208020ada7fee47f0fa2102fca3f4474e143132cc579be85272238e92feb3e5b111420515a88513376c65786be94b6900bf4a7f72604b03ecffed555dd4651e9022382097bb4a4335850a2a5826dfa9e1969c674bea114ac1af1f7fc024e8ba76f25ef5dda2c1be88c75ee4b149532a40419d93dc6e5f9da0ebd3501264458c6970f0a3d519529ff144b2a2c2696d89a043c370a5205594292ae9e7e3711b25c546d1fefc8eea7e23ad226226645dd3da284041b1ae330a411fa345bc69c8191ead939c1191c12d9d29bfa811024e26dc45a5a0cb700ada21767abb63d4d6ccc75eb70a04a71902e6e2989c851259d0355805cdb65e17a3159ef8fb889280105acb494e45f5f79704fd3dd671d5c1afd9186b3d9afa9ce08c5313a1e08026e4341cc59c86376377fc322b234e754ea196468180f6031454e9b100e67135678486ada1ccc88313b04ed58814dc4ff2b88a57d0f99ab654d4205cceb220523901e49f2ff238d3c0f2eb34b65d530f472e277949c42031d035582b49eca1f9460515618305766d8061d028023f609aa3654117697f7c406588850eb02c884841d3652c9e059c83bf0ee57233eb8e88939d3cc8c65a623719a0e86a1693a037a03d6b96e157ede0416923525489f1a602a6a13fea667596eaf014520583200a80116741c1345cde0ef9bc72f207aaa2902ea017540d1bafa017e9797c23d7afde98af422fa8e3fa53012ba9475f5d0f6f241f504b45a88f8908c1387452c034f0f97a0fd5f5516fcf0b67d10bea14ab3b0d6bf51faa4b98e4554b85dc7c42a260f415942ce877e3b980e0ae9d82aab64f96231714875e50d0280d8df361cb5cbfea1ea29f47d736aafb806918d239253e06ca3a5d72aaec9568692b372928a4c9421674118653b249d33c91ef8e020575e67b440705dc071a037f1d9ecb919326fa549e3c7677bd27884c517544f3a364c02861bbedd296bb1c24a36951b9a5bf4febcda02d8eb4db59d928e13c255b38fba08ce1ac6f71c3bbd5858feeee603d84345768771f21a39442e18c94b4d9273c42e88a7bf9967bbfe7a3e70ba1ee273334fe829205bda898c21e1d460e3b28783d1e49f2787b3ef4fa9cba0ba1b25157db1adc47c828fd3a276d2c89d94b463e7df7c8390579611b1afdd10bea542c04b653beb19f909118606806a3fb8069b8f132cae058c5d03436f7211fe978d7f06bcef35e3e1f6030d959161a2513eea4ce057be9f25a0183fb90c7d5ce8623d8af002de2235534a3a7a02209bac8f88fbcb1bf20f757d91a748aa38d53211ba5ee94490ce0d594313462efa37141c9953420c57806ea8a509f5b5f4155b34a067e512b1310a8c1979ac42c5b8d4ed1e03ee416b1391fbc9070797d41c082a27537d36441f733e98279504ceca56a3872143d15213b0b2be9faeee62050a98ad1857570e814c7e58262cd11b41c8ff26114f50585de4c73f043db9a8540255ca918e6ffe360cfd33adc87d8e356cabce82336ee0e211714b4b3a3db98c820cf114a8a23c7510b0a44b1990cd410b1a97f3b855a503467663151f626060edd7d40e41c33211222b95054f701bf7bac89108991cfa8d72053ace8661e44aa18b17f8d5a5000639d69331d9529465c20a3ba0fb83cda481604c4a846a678b2a35910ad221e8443771f10e31a7286d8fa82fa01391533879b0461bb4354d99b42751f2072ccfafcd5eb79874a4121ba0f88dccf24880c51b50f790ab9a0aa4d9a2c12cbd4fa902c6a330d60ec352915bb78556deb701f267d364f6194c636bafbd867d2f2ee71d554e8701ff4507320ac7788180b8aeb6c0ec552d5c78d919b69e07b079ad379b23c11a5a0d09a69f059ec22735291d443e5a16340a1c3ce9af4013d99cff2aa57787188de83a1279bd4ca2c8467d923eef9b065a8143463524151c94fb062842d1ff0d0e1ae1cd4699be6b24ca2a0e6f410c54bafbdbe4dcedf5390d8e64954374b4f36cbce524919d7b17cd81a095c5c794f2e2cefbe1c6239d1cc5cf3ba06d60983de60e52b37c16ff68d4179a17de894d11c6a41d5a45326862d7542ee82415b170cce4e6ce85e147f87584e347d3d455cb4434e0533803c8a5ec8142b8a898368cba016143394bc54f4434e855976369a497c1079cadb67258ea23bf200f5dd22f20aea1af48222eea3df297b6fe4821a68218e6233bafbb89dbc825a87ee3ed28883b00590ed2c81eea333bafbb8853c8a1cf4112a993486143b8d3c5bbc405e2a06a0a722973c8a07b9df80fb68835c4fcce3bf09f7b1903c3b8bee3ef6d989a340b7b3cca3e415147aef63661679143721bb8f35e415d488df849ddd8b3e42a5130761456ea631fdc94bc528f454649247f124f2d6cb15e441b4426ea6ad200f02b99946d724910791f220e2c5061c81131eb2fb606e2310827a18f198e75a122128343bcbac21912105ad99c60c24321368bd0f5221909a6964961362338d79825008ed5b79609ec8201502c17d90e800eb6283e6829a99422c04f5178d14a40e4e72a46a4c04b99240701f0cc90c9a9a69606c9a4f3404d585d332c25ac986a0e6c72a2890880d14e911e39e2ec0f032f10c5472d4a74ec1dfdd64251f826a1fe51351e0a5c5a9547388beb4ca1532f0586aef5654f3882e418e6e8a01c9b85e56aab94462afd045c68cf28433476fa19a53b4ebcd35ba9099e1667e984235afb0df3afa3b4efe2036f9497f8e5b51944035c3b0b7cfef4587aebaea35379d6abe61b1d86c160bd5122dd1122dd1122d6140fc0f6c0904d0ccc6efe10000000049454e44ae426082),
(13, 19, 'dino', '2023-10-12', 'pitbull', 'prueba', 'h', 0x89504e470d0a1a0a0000000d49484452000000c4000000f40803000000f30279f40000000467414d410000b18f0bfc6105000000017352474200aece1ce9000002fa504c544547704cbdbdbdc5c5c5b9b9bab6b6b6babababcbcbcbfbfbfc5c5c5bebebec3c3c3c5c5c5ccccccc8c8c8ccccccd6d6d6c0c0c0cacacad5d5d5d8d8d8dfdfdfd3d3d4c0c0c1b5b5b6ebebebc8c8c8dadadad8d8d8d9d9dac7c7c7b8b8b8a7a7a7e1e1e1d7d7d8d9d9d9dcdcdce8e8e8a1a1a1ededede9e9eacacacac1c1c1d9d9d9b9b9b9d9d9d9e9e9e9e1e1e1dfdfe0e5e5e5cfcfcfcbcbcbdcdcdce3e3e3b9b9b9e0e0e0d8d8d8e3e3e4bdbdbddadadaeaeaebcbcbcbdbdbdce8e8e8c2c2c2d8d8d8c3c3c3cacacac8c8c8dbdbdbaaaaaae6e6e6bbbbbbb5b5b5c8c8c8cacacaf2f2f2e5e5e6a4a4a4cdcdcdb1b1b1eaeaeac6c6c6c1c1c1e3e3e3dadadab6b6b6ededeecccccccfcfcfe1e1e1bebebebbbbbbc8c8c8bababaa7a7a7b0b0b0e5e5e6fbfbfbfefefefbfbfbe1e1e2dddddddfdfdfe1e1e2c1c1c1dededeeaeaeae8e8e9e3e3e3c6c6c6d5d5d5e3e3e3e3e3e3eaeaeaafafafd4d4d4d7d7d8ddddddcfcfcfbebebee0e0e1bbbbbbd0d0d0afafafbabababbbbbbd2d2d3c9c9c9b3b3b3b5b5b5d8d8d7d8d8d8eaeaeafffffffefefefefefeeaeaebaaaaaaeeeeeee7e7e7b5b5b5d9d9d9e4e4e5e2e2e2dbdbdbd8d8d8d8d8d8e8e8e9cececebababac6c6c6dededeb9b9b9c0c0c0c3c3c3a7a7a7bababadededec4c4c4d5d5d5f6f6f6f0f0f0fefefef2f2f2ffffffb9b9bbd7d7d7eeeeeebcbcbcf3f3f3adadadacacacdfdfdfb2b2b2c5c5c5c5c5c5e7e7e8f3f3f3e0e0e0a5a5a5d0d0d0ccccccbdbdbdf4f4f4fffffffefefefffffff5f5f5ffffffffffffffffffffffffececedc9c9c9d2d2d2e7e7e8a8a8a8cececeffffffffffffffffffd9a6e7e7e7e8d9d9d9a6a6a6e6e6e7a5a5a5d8d8d8a7a7a7e5e5e6d6d6d6a2a2a2d7d7d7fefefea1a1a1ffffffa0a0a09f9f9fa4a4a4a3a3a3e8e8e9dbdbdcededeeebebece9e9eaaeaeaed8d8d7e0e0e1fdfdfdacacacdddddea9a9a9b2b2b2dfdfdfbfbfbfe4e4e5e3e3e4e1e1e1bab6c3e2e2e3bababab7b7b7c3c3c3f8f8f8d1d1d2c7c7c8f0f0f1e1e1e2cbcbcce6e6e6f3f3f3cdcdcdd8d8d9a6a6a7a66f33a3000000c974524e53000e0314100b180205081c2f23105dfe1f381c175f3c341dcf5510f949292ced1f262be38bfaddf645414324f184c069e98951eab3b93b38955c52c16d9e6ca26b3c7ea0fbf4e3e3df91873cfef214d69797508133d1b4774aacac4964d4fbe6f6887961e3d5cbceb7dabcfea076654c7957dd7f8bf830c7552892f0c772daa9eff4cec417b297e6eee0a5cbc894f0d8f4acb9e89966baf0fad6def786c0c678c2e4592df89ee59f927ae5f571e8b1cea772b9e7a1aff4428d4adf34bcaba5d1f0e9b9fbc7f7c6e3d4ca84278d00000fb04944415478daed9d097414451ac73b934c329384907084842380842344ee2b1c722ab74160b9414e51511450110105414545116f5954bcaff5daf53e5677d7bd5ecff4f4f491ce5c31c31148487c100401dd7d6fab7a12329d4ccf74f594dd1537df03cc7bc430bff9be7fd5bfbeeaaaa1a896688996688996f8bf8ea4c4446bf37df52989690bc71fbafde69b8be66ec94ab53547047bdaa1bf7d5ae11224afd723382bfe9adf39d5d2dcb29076fb149757f0b99c6e104e97cf2355ec1a9bdcac1892c74f016fbfdbd9106ea7cfe3dedd39a9f954529f4f040112b81a20c0976e97a7323fbd993064deb6cda300b8c4e1167c4337378b1175e18b1e9f3b0203c470bbbcbb7e473e43dad683920a422819dedd69842324662cf382b75b8d41a6f07c984a3443d6277e413d0d75142ee7581bc9827ecfeb8c8e20eb42fa7404b1e3ea60754137a2f02e2274d62b9c7695a4050186af620b91e3eae07940d01a19402afe44602aba8cf3095a1160f80ff725ce282d5dee059ec28910c25c3b5108b60937487e94344037e8d99d48d4b83af12a8f130d0166e2b92ee42024e42ed32ee8f0f1e90439a2489be4937420c0ccb52345d063de431574c3f844068425eb196441878962001169d02568a220ac7d96797d6efd0c249453e63497140f82d3e51a65f6ca27772a5cf938e30897dbdca5b625fb7d41882b0db09aa6649a2ae8f57109ba2e0f9ec7134c1474c19d1e5fbc6980de69bc9982be568a1f01a4625b7bd3d230676af45686f66a7ad42c139bb7d82fe04803f47f260db00963b6c52de84bed8e8f4d599d5a266cc721e8bac6d372537c78f2f48312a64a826d824326ac4ded4ba6ea5af9a8a97aab096dccbbc66113b42c881dc6af4cade8ad0c67d476f20ec35d9325fbce38563e4d199c3d0719be559438f15a0f4604b7b0e916a337edec05cbf0095ade259a9d65741a3ae86d65a8a4419a67781aac23dfc12a685fd7ad866f73e50dc32b68cf0d0b8dde1e4abafb2026a3144a837fd3985646a7217b9ed78751d04eef24c3e7860e6fb9f00afa910ca32bc9ba64135641bbae9e6ef8f476d73041c02ae8617d28c3057d155e413f34c6f0ae46de3c0f5e41bf9e6df8cae72d2756410bb3328c7ed4ccbe64399656465dab15087a9ae14dbe0e8b71ae7ce0b86abca09ffe035641fbbaae375ed0cb700a1a8cab8b0d1774d2f39805fdd052e3053d15afa07b8e33bc1150885bd0b30c374a40d05eac82be7abae13da5bced98573ec30a1adbc9e42ed9eddb676d4e6f95f06b09da8db795d175a2620d9d5238beff1056e441888e35f9c38bf1cbdd5630156b2bc3d973b1620d6de9b396e5459675c8c182af1f7b371df311840ee330b73266dda21074b775e0ed5706cb3ffb7637acad8c6d785b19573fd546f10ff4eb2423b0610832c6e48dd8b49187b937e9d9de59f1f32f7b8c5700347088e2ca367804bdfe04de954fd7418a5686fd1a9e8dc410c2e01f684ba0a0bd372876422db70e115510ea285615c72f68ccad8c4de315db3e6de78334b06a0c218ad5b63805bd136f2ba3e76c652b63ecfe2869a8a360ef98119751ba53c06b94e629b772bbefe56320c814628e7e71272da8c02d684575dbe471351603fc0e7e758a4e414f988277e50304ad7829ed1fe3b520c81803bbeb6b654cc22b68e19ddb14d356f1cdad59cd0c0efe8f3ab46dcdbd17f3ca6787f20993764344ad0830c481e8aae8f2226641cf1aafb072e9fd79140448f119eaee21664103a3a4e8d4db36741211191cfc4a3bda0c8d59d09e61a3140b83116b51d300a2752f1423983e29bc95e16afc8a74ac7cd62b9e90292eeac4a23338d82bb53b286b4698a0ebfef40b8224087e97f3bfa818722b6382e21f1875a3a80301fe2f9769de6cf820ac9501fe03ce15bb4e54d69e3e79fa74a5db27f990b2116a65284a397d68eba846291a85c6738f49630e37b432a0200577ed39fe3c430783c10073943f73d82fc00153b3a07bce56b4886d0386e84b833c3c0dd7f45446c1018f3f3c0d52c5b9e381f260806660d08160b0fa6cadcfaf2d1950d08f2c54ccd09bfbf3ba110084161398fc945b0a4370fb5d27cf9707188e090b3a18e02b05576c0a59d0d315824ee877b9180783838d9d09fb9c7bc3563e300d95ff290f40029aa143c1c81909d217dcfe581470e5b3bd8fc228f4bd319e34c0ee474c61173e137e620cbcd5fe337490832f9b0e0b46e6287754f8a3ae30a0a0bb4ecfd46b94d486d818be2369e9e1f0950f60f05d28a71b23d46370c1a395827a2ee0cac7bbfb95fbc205bdb187181f02344f09d11fb33aa06865802ffcbf9433911842185cf0fc61d58a8282deb9f2ab3006cbab2fc105685c08c0c63e1c8d2175fab59e46770308e7cac3b41089a2ea842f22051c10a45dab5e99d100d1f6f3fd71a70166624bb471754aa3560660381d54670851949ff5ab09fade971e58b9eaab8e753fbfe32b93790c08e027a84bc236c6dd68e5e30227daaa025118e8d02075526a226ef95a847ffcf3fe3f3fb0fa55d9e858ee9bf152bc82aeafa63755d7a70913055f93d7225c28e7a231c8836da0a6a25141c982ae0deef9f2df5f7fbe7a46b7b6ddbabdfac5fd5762494354d3615dd064e27281f3b61c7cafe9e814a0a08426e3aa9b2f2d3df6dabfbefd66e5eacf667cb1eafe7d3c8b85012462be5a7bdc32d81761f2157e29bf183d11a18a0a9e16c24765b7df73f227c0505af2da9e6f41457df3f5cbac88270d6068dbaf9a88ec9d11262d5fc5a900138b412ea8a36e57d80cefada8020825a5252525201b7bbedc731c5725c96d02354524bfef8da04de96490890d2117d42f5208020ada7fee47f0fa2102fca3f4474e143132cc579be85272238e92feb3e5b111420515a88513376c65786be94b6900bf4a7f72604b03ecffed555dd4651e9022382097bb4a4335850a2a5826dfa9e1969c674bea114ac1af1f7fc024e8ba76f25ef5dda2c1be88c75ee4b149532a40419d93dc6e5f9da0ebd3501264458c6970f0a3d519529ff144b2a2c2696d89a043c370a5205594292ae9e7e3711b25c546d1fefc8eea7e23ad226226645dd3da284041b1ae330a411fa345bc69c8191ead939c1191c12d9d29bfa811024e26dc45a5a0cb700ada21767abb63d4d6ccc75eb70a04a71902e6e2989c851259d0355805cdb65e17a3159ef8fb889280105acb494e45f5f79704fd3dd671d5c1afd9186b3d9afa9ce08c5313a1e08026e4341cc59c86376377fc322b234e754ea196468180f6031454e9b100e67135678486ada1ccc88313b04ed58814dc4ff2b88a57d0f99ab654d4205cceb220523901e49f2ff238d3c0f2eb34b65d530f472e277949c42031d035582b49eca1f9460515618305766d8061d028023f609aa3654117697f7c406588850eb02c884841d3652c9e059c83bf0ee57233eb8e88939d3cc8c65a623719a0e86a1693a037a03d6b96e157ede0416923525489f1a602a6a13fea667596eaf014520583200a80116741c1345cde0ef9bc72f207aaa2902ea017540d1bafa017e9797c23d7afde98af422fa8e3fa53012ba9475f5d0f6f241f504b45a88f8908c1387452c034f0f97a0fd5f5516fcf0b67d10bea14ab3b0d6bf51faa4b98e4554b85dc7c42a260f415942ce877e3b980e0ae9d82aab64f96231714875e50d0280d8df361cb5cbfea1ea29f47d736aafb806918d239253e06ca3a5d72aaec9568692b372928a4c9421674118653b249d33c91ef8e020575e67b440705dc071a037f1d9ecb919326fa549e3c7677bd27884c517544f3a364c02861bbedd296bb1c24a36951b9a5bf4febcda02d8eb4db59d928e13c255b38fba08ce1ac6f71c3bbd5858feeee603d84345768771f21a39442e18c94b4d9273c42e88a7bf9967bbfe7a3e70ba1ee273334fe829205bda898c21e1d460e3b28783d1e49f2787b3ef4fa9cba0ba1b25157db1adc47c828fd3a276d2c89d94b463e7df7c8390579611b1afdd10bea542c04b653beb19f909118606806a3fb8069b8f132cae058c5d03436f7211fe978d7f06bcef35e3e1f6030d959161a2513eea4ce057be9f25a0183fb90c7d5ce8623d8af002de2235534a3a7a02209bac8f88fbcb1bf20f757d91a748aa38d53211ba5ee94490ce0d594313462efa37141c9953420c57806ea8a509f5b5f4155b34a067e512b1310a8c1979ac42c5b8d4ed1e03ee416b1391fbc9070797d41c082a27537d36441f733e98279504ceca56a3872143d15213b0b2be9faeee62050a98ad1857570e814c7e58262cd11b41c8ff26114f50585de4c73f043db9a8540255ca918e6ffe360cfd33adc87d8e356cabce82336ee0e211714b4b3a3db98c820cf114a8a23c7510b0a44b1990cd410b1a97f3b855a503467663151f626060edd7d40e41c33211222b95054f701bf7bac89108991cfa8d72053ace8661e44aa18b17f8d5a5000639d69331d9529465c20a3ba0fb83cda481604c4a846a678b2a35910ad221e8443771f10e31a7286d8fa82fa01391533879b0461bb4354d99b42751f2072ccfafcd5eb79874a4121ba0f88dccf24880c51b50f790ab9a0aa4d9a2c12cbd4fa902c6a330d60ec352915bb78556deb701f267d364f6194c636bafbd867d2f2ee71d554e8701ff4507320ac7788180b8aeb6c0ec552d5c78d919b69e07b079ad379b23c11a5a0d09a69f059ec22735291d443e5a16340a1c3ce9af4013d99cff2aa57787188de83a1279bd4ca2c8467d923eef9b065a8143463524151c94fb062842d1ff0d0e1ae1cd4699be6b24ca2a0e6f410c54bafbdbe4dcedf5390d8e64954374b4f36cbce524919d7b17cd81a095c5c794f2e2cefbe1c6239d1cc5cf3ba06d60983de60e52b37c16ff68d4179a17de894d11c6a41d5a45326862d7542ee82415b170cce4e6ce85e147f87584e347d3d455cb4434e0533803c8a5ec8142b8a898368cba016143394bc54f4434e855976369a497c1079cadb67258ea23bf200f5dd22f20aea1af48222eea3df297b6fe4821a68218e6233bafbb89dbc825a87ee3ed28883b00590ed2c81eea333bafbb8853c8a1cf4112a993486143b8d3c5bbc405e2a06a0a722973c8a07b9df80fb68835c4fcce3bf09f7b1903c3b8bee3ef6d989a340b7b3cca3e415147aef63661679143721bb8f35e415d488df849ddd8b3e42a5130761456ea631fdc94bc528f454649247f124f2d6cb15e441b4426ea6ad200f02b99946d724910791f220e2c5061c81131eb2fb606e2310827a18f198e75a122128343bcbac21912105ad99c60c24321368bd0f5221909a6964961362338d79825008ed5b79609ec8201502c17d90e800eb6283e6829a99422c04f5178d14a40e4e72a46a4c04b99240701f0cc90c9a9a69606c9a4f3404d585d332c25ac986a0e6c72a2890880d14e911e39e2ec0f032f10c5472d4a74ec1dfdd64251f826a1fe51351e0a5c5a9547388beb4ca1532f0586aef5654f3882e418e6e8a01c9b85e56aab94462afd045c68cf28433476fa19a53b4ebcd35ba9099e1667e984235afb0df3afa3b4efe2036f9497f8e5b51944035c3b0b7cfef4587aebaea35379d6abe61b1d86c160bd5122dd1122dd1122d6140fc0f6c0904d0ccc6efe10000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--
DROP TABLE IF exists veterinaria.usuario;
CREATE TABLE `veterinaria`.`usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `correoUsuario` varchar(100) NOT NULL,
  `telefono` char(9) NOT NULL,
  `contraseña` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `veterinaria`.`usuario` (`idUsuario`, `nombreUsuario`, `correoUsuario`, `telefono`, `contraseña`) VALUES
(18, 'messi', 'messi@gmail.com', '947954713', 'e10adc3949ba59abbe56e057f20f883e'),
(19, 'luis', 'luis@gmail.com', '924822216', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinario`
--
DROP TABLE IF exists veterinaria.veterinario;
CREATE TABLE `veterinaria`.`veterinario` (
  `idVeterinario` int(11) NOT NULL,
  `nombreVeterinario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `veterinario`
--

INSERT INTO `veterinaria`.`veterinario` (`idVeterinario`, `nombreVeterinario`, `correo`, `contraseña`) VALUES
(4, 'Antonella', 'antonella@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detallehistorial`
--
ALTER TABLE `veterinaria`.`detallehistorial`
  ADD PRIMARY KEY (`idHistorial`,`idVeterinario`),
  ADD KEY `idVeterinario` (`idVeterinario`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `veterinaria`.`historial`
  ADD PRIMARY KEY (`idHistorial`),
  ADD KEY `idVeterinario` (`idVeterinario`),
  ADD KEY `idMascota` (`idMascota`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `veterinaria`.`mascota`
  ADD PRIMARY KEY (`idMascota`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `veterinaria`.`usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `veterinario`
--
ALTER TABLE `veterinaria`.`veterinario`
  ADD PRIMARY KEY (`idVeterinario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `veterinaria`.`historial`
  MODIFY `idHistorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `veterinaria`.`mascota`
  MODIFY `idMascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `veterinaria`.`usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `veterinario`
--
ALTER TABLE `veterinaria`.`veterinario`
  MODIFY `idVeterinario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallehistorial`
--
ALTER TABLE `veterinaria`.`detallehistorial`
  ADD CONSTRAINT `detallehistorial_ibfk_1` FOREIGN KEY (`idHistorial`) REFERENCES `historial` (`idHistorial`),
  ADD CONSTRAINT `detallehistorial_ibfk_2` FOREIGN KEY (`idVeterinario`) REFERENCES `veterinario` (`idVeterinario`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `veterinaria`.`historial`
  ADD CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`idMascota`) REFERENCES `mascota` (`idMascota`);

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `veterinaria`.`mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
