cwlVersion: v1.2
$namespaces:
  cwltool: "http://commonwl.org/cwltool#"
class: CommandLineTool
label: Run segmentation

requirements:
  DockerRequirement:
    dockerPull: hubmap/segmentations:1.2.3
    dockerOutputDirectory: "/output"
  cwltool:CUDARequirement:
    cudaComputeCapability: '3.0'
    cudaDeviceCountMax: 8
    cudaDeviceCountMin: 1
    cudaVersionMin: '11.4'
  NetworkAccess:
    networkAccess: true

baseCommand: ["python", "/opt/main.py"]

inputs:
  method:
    type: string
    inputBinding:
      prefix: "--method"

  dataset_dir:
    type: Directory
    inputBinding:
      prefix: "--dataset_dir"

  gpus:
    type: string
    inputBinding:
      prefix: "--gpus"

outputs:
  mask_dir:
    type: Directory
    outputBinding:
      glob: "/output"
