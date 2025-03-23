cask "lpub3d" do
  arch arm: "arm64", intel: "x86_64"

  version "2.4.9.86.4133_20250319"
  sha256 arm: "0e934c1380939f407d4304386a3cc5f1a936e8fc0da30cbdad828e947aaaaf6c",
         intel: "8235ad4231046ba2dc67280edf5802a0afb9fcfbe999dfda7e184560d57ee0ea"

  url "https://github.com/trevorsandy/lpub3d/releases/download/continuous/LPub3D-#{version}-#{arch}-macos.dmg",
      verified: "github.com/trevorsandy/"
  name "LPub3D"
  desc "LDraw Building Instruction Editor"
  homepage "https://trevorsandy.github.io/lpub3d/"

  livecheck do
    url :url
	regex(/LPub3D[._-](\d+(?:\.\d+)+[._-](?:\d{8}))[._-]#{arch}[._-]macos\.dmg/i)
    strategy :github_latest
  end

  depends_on macos: ">= :sierra"
  depends_on cask: "xquartz"
  depends_on formula: "openexr"
  depends_on formula: "libpng"
  depends_on formula: "jpeg-turbo"
  depends_on formula: "libtiff"
  depends_on formula: "tinyxml"
  depends_on formula: "gl2ps"
  depends_on formula: "minizip"
  depends_on formula: "sdl2"

  app "LPub3D.app"

  zap trash: [
    "~/Library/Application Support/LPub3D Software",
    "~/Library/Preferences/com.lpub3d-software.LPub3D.plist",
  ]
end
