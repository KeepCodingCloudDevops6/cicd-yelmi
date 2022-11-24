const core = require('@actions/core');
const github = require('@actions/github');
const exec = require('@actions/exec');

function run() {
    // Get some input values
    const bucket = core.getInput('bucket', { required: true})
    const bucketRegion = core.getInput('bucket-region', { required: true})
    const folder = core.getInput('dist-folder', { required: true})

    // Upload files
    const s3uri = `s3://${bucket}`
    exec.exec(`aws s3 sync ${folder} ${s3uri} --region ${bucketRegion}`);

    const website = `http://${bucket}.s3-website-${bucketRegion}.amazonaws.com`

    core.setOutput('website-url', website)
}

run();