import process from 'process'
import minimist from 'minimist'
import { Web3Storage, getFilesFromPath } from 'web3.storage'

async function main() {
    //Storing filename convention should be PatientID_DateTime.PDF
    // const args = minimist(process.argv.slice(2))
    const args = "node StorePDF.js"
    const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweGIyNEJiQTc1RDJDMTY1M0I5NTM0NjRkNjJlODYyRjZhOERBM0JGQ0YiLCJpc3MiOiJ3ZWIzLXN0b3JhZ2UiLCJpYXQiOjE2NTM0NTE0MDEzNTAsIm5hbWUiOiJNZWRpY2FsIFBERidzIn0.0omUl-6U9d9VdSLZ1owBjFn_VIZjA8viCzOv2Q-LRDY"
    const filename = "fileLocationHere";

    if (!token) {
        return console.error('A token is needed to access or store the information!')
    }

    // if (args._.length < 1) {
    //     return console.error('Please supply the path to a file or directory')
    // }
    if (filename._.length < 1) {
        return console.error('Please supply the path to a file or directory')
    }
    const storage = new Web3Storage({ token })
    const files = []

    for (const path of args._) {
        const pathFiles = await getFilesFromPath(path)
        files.push(...pathFiles)
    }

    console.log(`Uploading ${files.length} files`)
    const cid = await storage.put(files)
    console.log('Content added with CID:', cid)
    const url = "https://" + cid + ".ipfs.dweb.link/";
    console.log('To access the Uploaded Content, Click the Link ▶ ', url)
}

main()


// node storePDF.js ~/1.pdf