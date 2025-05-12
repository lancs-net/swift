{
	description = "A flake for building wodan-rs";

	inputs = {
		nixpkgs.url = "nixpkgs";
		#nixpkgs.url = "github:NixOS/nixpkgs/cf4c21a3a2234a65ff408b208432ac65a31b617b";
		nixos-generators = {
			url = "github:nix-community/nixos-generators";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, nixos-generators }:
	let
		pkgs = import nixpkgs {
			system = "x86_64-linux";
			config = {
				allowUnfree = true;
				permittedInsecurePackages = [
					"openssl-1.1.1u"
				];
			};
		};
		macpkgs = import nixpkgs {
			system = "x86_64-darwin";
			config = {allowUnfree = true;};
		};
		py-pkgs = pp: with pp; [
			pip
			rdflib
			pandas
			matplotlib
			#python-packages.debugpy
		];
		macpy-pkgs = pp: with pp; [
			pip
			debugpy
		];
		my-py = pkgs.python3Full.withPackages py-pkgs;
		mac_fks = macpkgs.darwin.apple_sdk.frameworks;

		buildOz = pkgs.rustPlatform.buildRustPackage {
			pname = "wodan";
			version = "0.1.0";
			src = ./.;
			cargoSha256 = "OnSWD25Md8SDDIw7wcUSU7bH6ZrXw/1zuC6ITcxPVCk=";
			target = "x86_64-linux";
		};

	in {

		packages.x86_64-linux.default = buildOz;

		containerImage = pkgs.dockerTools.buildImage {
			name = "oz";
			tag = "latest";
			created = "now";
			copyToRoot = pkgs.buildEnv {
				name = "image-root";
				paths = with pkgs; [
					dockerTools.usrBinEnv
					dockerTools.binSh
					dockerTools.caCertificates
					dockerTools.fakeNss
					buildOz
				];
				pathsToLink = [ "/bin" ];
			};
			config = {
				Cmd = [ "oz" ];
				#WorkingDir = "/";
			};
		};

		devShell.x86_64-linux = pkgs.mkShell {
			nativeBuildInputs = with pkgs; [ rustc cargo gcc clang ];
			buildInputs = with pkgs; [ 
				llvmPackages.libclang
				llvmPackages.libcxxClang
				llvmPackages.bintools
				my-py
				lldb
				openssl
				openssl.dev
				pkg-config
				libyang
				clang
				swiProlog
				maturin
				just
				rust-analyzer
				pyright
			];
			DOCKER_HOST="unix:///var/run/podman/podman.sock";
			PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
			RUST_LOG = "oz=info";
			LIBCLANG_PATH = pkgs.lib.makeLibraryPath [ pkgs.llvmPackages.libclang.lib ];
			BINDGEN_EXTRA_CLANG_ARGS = with pkgs; [
				''-isystem ${llvmPackages.libclang.lib}/lib/clang/${llvmPackages.libclang.version}/include''
				''-I${pkgs.glibc.dev}/include''
				''-I${pkgs.glibc.dev}/include/glib-2.0''
				''-I${pkgs.glibc.out}/lib/glib-2.0/include/''
			];
			shellHook = ''
				export PIP_PREFIX="$(pwd)/_build/pip_packages"
				export PYTHONPATH="$PIP_PREFIX/${macpkgs.python3.sitePackages}:$PYTHONPATH"
				export DEBUGPYPATH="${my-py}/bin/python3"
				export PATH="$PIP_PREFIX/bin:$PATH"
				export VIRTUAL_ENV="$(pwd)/.env"
				unset SOURCE_DATE_EPOCH
			'';
		};

		devShell.x86_64-darwin = macpkgs.mkShell {
			nativeBuildInputs = with macpkgs; [ rustc cargo gcc ];
			buildInputs = with macpkgs; [ 
				llvmPackages.libclang
				llvmPackages.libcxxClang
				llvmPackages.bintools
				lldb
				rust-analyzer
				nil
				openssl 
				openssl.dev 
				pkg-config 
				rustc 
				cargo
				#clang
				#cmake
				libyang
				gcc 
				libiconv
				python3
				maturin
				swiProlog
				mac_fks.CoreFoundation 
				mac_fks.Security 
				mac_fks.CoreServices
			];
		   PKG_CONFIG_PATH = "${macpkgs.openssl.dev}/lib/pkgconfig";
		   LD_LIBRARY_PATH = "${macpkgs.swiProlog}/lib:$LD_LIBRARY_PATH";
		   SWIPL="${macpkgs.swiProlog}/bin/swipl";
		   BINDGEN_EXTRA_CLANG_ARGS = with macpkgs; [
			   ''-isystem ${llvmPackages.libclang.lib}/lib/clang/${llvmPackages.libclang.version}/include''
			   #''-I${macpkgs.glibc.dev}/include''
			   #''-I${macpkgs.glibc.dev}/include/glib-2.0''
			   #''-I${macpkgs.glibc.out}/lib/glib-2.0/include/''
			];
			shellHook = ''
				export PIP_PREFIX="$(pwd)/_build/pip_packages"
				export PYTHONPATH="$PIP_PREFIX/${macpkgs.python3.sitePackages}:$PYTHONPATH"
				export DEBUGPYPATH="${my-py}/bin/python3"
				export PATH="$PIP_PREFIX/bin:$PATH"
				export VIRTUAL_ENV="$(pwd)/.env"
				unset SOURCE_DATE_EPOCH
			'';
		};

	};
}
